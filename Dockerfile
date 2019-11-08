FROM azul/zulu-openjdk-alpine
RUN apk update

ENV ACTIVEMQ_VERSION 5.15.10
ENV ACTIVEMQ apache-activemq-$ACTIVEMQ_VERSION

ENV ACTACCOUNT act1appl
ENV ACTACCOUNT_HOME /home/act1appl

ENV ACTIVEMQ_HOME /opt/$ACTIVEMQ
ENV ACTIVEMQ_SCRIPT activemq.sh

RUN adduser  -D -s /bin/bash $ACTACCOUNT
RUN mkdir -p $ACTACCOUNT_HOME/bin/
COPY $ACTIVEMQ_SCRIPT $ACTACCOUNT_HOME/bin/
RUN chown -R $ACTACCOUNT $ACTACCOUNT_HOME
RUN chgrp -R $ACTACCOUNT $ACTACCOUNT_HOME
RUN chmod +x $ACTACCOUNT_HOME/bin/$ACTIVEMQ_SCRIPT

COPY $ACTIVEMQ-bin.tar.gz /tmp/$ACTIVEMQ-bin.tar.gz

RUN tar xf /tmp/$ACTIVEMQ-bin.tar.gz -C /opt/ 
RUN chown -R $ACTACCOUNT $ACTIVEMQ_HOME
RUN chgrp -R $ACTACCOUNT $ACTIVEMQ_HOME
RUN rm /tmp/$ACTIVEMQ-bin.tar.gz

WORKDIR $ACTACCOUNT_HOME
EXPOSE 61616 8161 5672

USER $ACTACCOUNT
ENV PATH $PATH:$ACTIVEMQ_HOME/bin:$ACTACCOUNT_HOME/bin
CMD [ "ls", "-altr" , "/opt/apache-activemq-5.15.10/bin" ]


