FROM lqss/jenkins:admin

COPY /generator.sh /script/generator.sh
USER root
RUN chmod +x /script/generator.sh
USER jenkins

CMD /bin/bash /script/generator.sh data.env >/dev/null  && /usr/local/bin/jenkins.sh