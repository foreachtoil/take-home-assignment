# This is a candidate assessment assignment from stack.io

# Guideline

Welcome to our `Take Home Assingment`. We are going to provide you with a sequence of tasks to be executed:
* [Task 1](dockerize): Dockerize a simple golang webserver;
* [Task 2](kubernetes): Deploy that docker image to your local k8s cluster following the given spec
docker push --> Pusheá a DockerHub con un tag que quieras (ponele stack_go, o lo que quieras). 
minikube 
1 pod --> mysql_connection
1 deployment --> 1 pod [1 init container (alpine --> sleep 30), 1 container] && 1 service que apunte a las labels del deployment
ServiceType: ClusterIP
* Optional MetalLB 
service --> k port-forward svc/<svc-name> 3001:80




* [Task 3](terraform): Create a terraform module
* [Task 4](linux): Write down a shell script for further automation
