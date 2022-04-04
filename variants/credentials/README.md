# Credentials variant
Credentials variant is the image variant of `lqss/jenkins` which allows a user to preload initial credentials as username and password (eg. dockerhub, github, gitlab...).

## Quick start
You can start the container by running the following command:
ENV ID id
ENV USER user
ENV PASSWORD pass
```sh
docker run -d -p 8080:8080 -e ID=<cred-id> -e USER=<cred-user> -e PASSWORD=<cred-pass> lqss/jenkins:anonymous-kubectl
```
by default if you don't specify the credentials it will take the following defaults:

| ID   | USER   | PASSWORD |
| ---- | ------ | -------- |
| *id* | *user* | *pass*   |

You can use you credentials in your pipeline like so:
```groovy
pipeline{
    environment {
        pipelineCred = 'id' // <--- this must match your creds ID
    }     
    agent any
    stages{
      stage('Your stage') {
        script {
            // You can use your dockerhub creds as follows
            docker.withRegistry('', pipelineCred) {
            dockerImage.push()
          }
        }
      }
    }
}
```