1. Put your auth json to /creds/bigtable.json

2. Build it

`docker build -t korjavin/janusgraph:v5`

3. Start elastic:
`docker run -e discovery.type=single-node --name=elk --rm -p 9200:9200 elasticsearch:7.6.1`


4. Start janusgraph
`docker run --rm --name jg --link elk:elasticsearch  -e GOOGLE_APPLICATION_CREDENTIALS=/creds/bigtable.json  -p 8182:8182 korjavin/janusgraph:v5`

5. Use apache-tinkerpop-gremlin-console-3.4.6

```
./bin/gremlin.sh
:remote connect tinkerpop.server conf/remote.yaml session
:remote console
gremlin> v1 = graph.addVertex(label, 'hello')
==>v[4304]
gremlin> g.V()
==>v[4304]
gremlin> v2 = graph.addVertex(label, 'world')
==>v[4136]
gremlin> g.V()
==>v[4136]
==>v[4304]

```
