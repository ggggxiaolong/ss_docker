FROM ubuntu:16.04

ENV SS_HOME /usr/local/ss
RUN mkdir -p "$SS_HOME"
WORKDIR $SS_HOME

COPY ss/* /usr/local/ss/
ADD ./start.sh /usr/local/ss/start.sh
RUN chmod 755 /usr/local/ss/shart.sh

EXPOSE 8387 8388 8389 8386

CMD ["usr/local/ss/start.sh"]
