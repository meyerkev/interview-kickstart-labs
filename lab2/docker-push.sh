#!/bin/bash
docker build --no-cache -t calc .
docker tag calc meyerkev248/calc:test
docker push meyerkev248/calc:test

kubectl apply -f namespace.yaml
kubectl config set-context --current --namespace=calc

kubectl apply -f .
echo "To delete, run kubectl delete -f . or kubectl delete all if you have an isolated namespace"
echo "Give it a minute or two, then run curl <the elb>/api?3+2"

echo "Sleeping 10 seconds to give the service time to start"
sleep 10
while true; do
    kubectl get svc calc && break
    sleep 10
done
ENDPOINT=$(kubectl get svc calc -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')

if [[ -z "$ENDPOINT" ]]; then
    echo "No hostname found, trying IP"
    ENDPOINT=$(kubectl get svc calc -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
fi

if [[ -z "$ENDPOINT" ]]; then
    echo "Did you run minikube tunnel?"
    exit 1
fi

echo "Testing endpoint $ENDPOINT/api?3+2"

while true; do
    curl $ENDPOINT/api?3+2 && break
    sleep 10
done
