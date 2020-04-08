#FROM janus:v0.5.1
FROM janusgraph/janusgraph:0.5.1
MAINTAINER  korjavin@gmail.com

ADD creds/ /creds/
WORKDIR /opt/janusgraph

ADD gremlin-server.yaml /etc/opt/janusgraph/gremlin-server.yaml
ADD janusgraph-hbase.properties /etc/opt/janusgraph/janusgraph.properties

CMD ["/opt/janusgraph/bin/gremlin-server.sh","/etc/opt/janusgraph/gremlin-server.yaml"]
