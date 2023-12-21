# Lab 2

Run the 2nd lab, specifically loose kubernetes yaml's

This consists of a service and a deployment wrapping an api server.  

The endpoint is `/api?<a mathematical expression>`

For example, if it's running on `localhost`, you can run `curl "localhost/api?2+3"` and get a result `{"operation":"3+2","result":"5"}`

## How to run

1. Update ./docker-push.sh to point at YOUR dockerhub or ECR repository
2. `./docker-push.sh` will build the image, push it, apply the k8s, then wait for the service to come up.  

Note that this assumes that you're using a loadbalancer under most circumstances and it will fail out after the apply if you're using a NodePort or ClusterIP.  (Which is still a useful demo)

If you need to do individual parts, you can just copy-paste individual commands