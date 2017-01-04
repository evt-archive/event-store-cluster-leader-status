require_relative '../automated_init'

context "Get Cluster Leader, EventStore Is Not Clustered" do
  host = Controls::Hostname::NonCluster.example
  ip_address = Controls::IPAddress::NonCluster.example

  connect_http = Controls::ConnectHTTP.example host: host, ip_addresses: [ip_address]
  connect_http.read_timeout = 0.1

  get_leader = EventStore::Clustering::GetLeader.build connect_http

  test "Non cluster error is raised" do
    assert proc { get_leader.() } do
      raises_error? EventStore::Clustering::GossipEndpoint::Get::NonClusterError
    end
  end
end
