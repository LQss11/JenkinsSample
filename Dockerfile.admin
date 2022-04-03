FROM jenkins/jenkins:lts

# Skip install plugins wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Install init plugins
RUN jenkins-plugin-cli --plugins docker-workflow cloudbees-folder timestamper \
ws-cleanup pipeline-stage-view pam-auth pipeline-github-lib \
matrix-auth ssh build-timeout github-branch-source  ssh-slaves \
email-ext antisamy-markup-formatter workflow-aggregator git ldap authorize-project \
configuration-as-code

# Setup Jenkins init admin User
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
COPY /groovy/default-user.groovy /usr/share/jenkins/ref/init.groovy.d/