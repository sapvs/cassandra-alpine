# cassandra-alpine
Low profile Cassandra image on low profile oprenjre-alpine image

**Does not support cqlsh**

## Naming 
Images are named as

    sapvs/cassandra-alpine|<Cassandra version>-<Open Jre version>

e.g.

    sapvs/cassandra-alpine|4.0.1-8

## Using this image

Images are hosted at DockerHub


    docker pull sapvs/cassandra-alpine|4.0.1-8

Configuration

Set below variables and required values in environment. [Sample](sample)

| Property Name | Detail|
|---|--|
|CASSANDRA_LISTEN_ADDRESS | This variable is for controlling which IP address to listen for incoming connections on. The default value is auto, which will set the listen_address option in cassandra.yaml to the IP address of the container as it starts. This default should work in most use cases.|
|CASSANDRA_BROADCAST_ADDRESS| This variable is for controlling which IP address to advertise to other nodes. The default value is the value of CASSANDRA_LISTEN_ADDRESS. It will set the broadcast_address and broadcast_rpc_address options in cassandra.yaml.|
| CASSANDRA_RPC_ADDRESS| This variable is for controlling which address to bind the thrift rpc server to. If you do not specify an address, the wildcard address (0.0.0.0) will be used. It will set the rpc_address option in cassandra.yaml.|
| CASSANDRA_START_RPC| This variable is for controlling if the thrift rpc server is started. It will set the start_rpc option in cassandra.yaml.|
| CASSANDRA_SEEDS| This variable is the comma-separated list of IP addresses used by gossip for bootstrapping new nodes joining a cluster. It will set the seeds value of the seed_provider option in cassandra.yaml. The CASSANDRA_BROADCAST_ADDRESS will be added the the seeds passed in so that the server will talk to itself as well.|
| CASSANDRA_CLUSTER_NAME| This variable sets the name of the cluster and must be the same for all nodes in the cluster. It will set the cluster_name option of cassandra.yaml.|
| CASSANDRA_NUM_TOKENS| This variable sets number of tokens for this node. It will set the num_tokens option of cassandra.yaml.|
| CASSANDRA_DC| This variable sets the datacenter name of this node. It will set the dc option of cassandra-rackdc.properties. You must set CASSANDRA_ENDPOINT_SNITCH to use the "GossipingPropertyFileSnitch" in order for Cassandra to apply cassandra-rackdc.properties, otherwise this variable will have no effect.|
| CASSANDRA_RACK| This variable sets the rack name of this node. It will set the rack option of cassandra-rackdc.properties. You must set CASSANDRA_ENDPOINT_SNITCH to use the "GossipingPropertyFileSnitch" in order for Cassandra to apply cassandra-rackdc.properties, otherwise this variable will have no effect.|
| CASSANDRA_ENDPOINT_SNITCH| This variable sets the snitch implementation this node will use. It will set the endpoint_snitch option of cassandra.yml.|

## Source Code

https://github.com/sapvs/cassandra-alpine
