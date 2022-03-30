FROM jenkins/jenkins:lts




# Install init plugins
RUN jenkins-plugin-cli --plugins docker-workflow cloudbees-folder timestamper \
ws-cleanup pipeline-stage-view pam-auth pipeline-github-lib \
matrix-auth ssh build-timeout github-branch-source  ssh-slaves \
email-ext antisamy-markup-formatter workflow-aggregator git ldap authorize-project \
configuration-as-code


