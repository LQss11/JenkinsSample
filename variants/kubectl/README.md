# Kubectl variant
Kubectl variant is the image variant of `lqss/jenkins` which allows a user to load kube config as a secret file on startup to use kubectl commands.

# Quick start
You can start the container by running the following command:
```sh
docker run -d -p 8080:8080 -v <path-to-kubeconfig>:/kube/config lqss/jenkins:anonymous-kubectl
```
>Make sure to load the kubeconfig inside the container using bind mount with -v on `/kube/config` inside the container.

To check the connectivity you can run:
```sh
docker exec -it <CONTAINER-ID> bash -c "kubectl get all  --kubeconfig  /kube/config"
```
or you can also use a jenkins pipeline as an example
```groovy
pipeline{
    agent any
    stages{
      stage('Apply Kubernetes files') {
          steps{
            withKubeConfig([credentialsId: 'kube']) {
              sh 'kubectl get all'
            }              
          }
      }
    }
}
```