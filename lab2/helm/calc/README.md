# Lab 2 Helm chart (aka Lab 3)

Basic install:
```shell
helm upgrade \
    --install calc . \
    --namespace helm-calc \
    --create-namespace \
    --wait
```

This will output some instructions.  Follow them to test your server on the `/api?<a math expression>` endpoint

To change the service type:
```shell
helm upgrade \
    --install calc . \
    --namespace helm-calc \
    --create-namespace \
    --wait \
    --set "service.type=LoadBalancer,service.port=8000"
```

Alternatively, you can update the values.yaml file or provide an additional values.yaml file using the `--values` flag

Noting that I haven't yet put this work in, we could also play with ingresses and the ALB controller and this is an interesting exercise.  

## TODO:

[https://kubernetes-sigs.github.io/aws-load-balancer-controller/](https://kubernetes-sigs.github.io/aws-load-balancer-controller/) contains the documentation for the ALB controller.  Stand up a cluster using [the EKS cluster repository](https://github.com/meyerkev/eks-tf-interview-template) I use to build the AWS cluster and make a 2nd values.yaml file to enable an ALB ingress