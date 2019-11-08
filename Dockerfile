FROM azul/zulu-openjdk-alpine


ENV ACTIVEMQ_VERSION 5.15.10
ENV ACTIVEMQ apache-activemq-$ACTIVEMQ_VERSION

ENV ACTACCOUNT act1appl
ENV ACTIVEMQ_HOME /home/$ACTACCOUNT

RUN adduser  -D -s /bin/bash $ACTACCOUNT

COPY $ACTIVEMQ-bin.tar.gz /tmp/$ACTIVEMQ-bin.tar.gz

RUN tar xf /tmp/$ACTIVEMQ-bin.tar.gz -C /opt/ 
RUN chown -R $ACTACCOUNT /opt/$ACTIVEMQ $ACTIVEMQ_HOME 
RUN ln -s /opt/$ACTIVEMQ $ACTIVEMQ_HOME 
RUN rm /tmp/$ACTIVEMQ-bin.tar.gz

WORKDIR $ACTIVEMQ_HOME
EXPOSE 61616 8161 5672

USER $ACTACCOUNT
ENTRYPOINT ["/opt/$ACTIVEMQ/bin/activemq start"]

