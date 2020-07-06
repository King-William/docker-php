FROM elasticsearch:7.4.0
MAINTAINER wuyihao <303440188@qq.com>
COPY elasticsearch-analysis-ik-7.4.0.zip /home/elasticsearch-analysis-ik-7.4.0.zip
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install -b file:///home/elasticsearch-analysis-ik-7.4.0.zip