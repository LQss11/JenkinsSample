FROM lqss/jenkins:admin

RUN jenkins-plugin-cli --plugins kubernetes-cli

# Download Kubernetes release
ARG KUBERNETES_RELEASE=v1.23.3
USER root
RUN curl -L https://dl.k8s.io/release/${KUBERNETES_RELEASE}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl  && chmod +x /usr/local/bin/kubectl
USER jenkins

COPY /load-kubeconfig.groovy /usr/share/jenkins/ref/init.groovy.d/