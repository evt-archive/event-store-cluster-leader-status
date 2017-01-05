require_relative '../automated_init'

context "Get Cluster Status From Gossip Endpoint, EventStore Is Non-Clustered" do
  host = Controls::Hostname::NonCluster.example
  ip_address = Controls::IPAddress::NonCluster.example

  context "EventStore gossip endpoint tolerance exceeds read timeout on HTTP connection" do
    connect_http = Controls::ConnectHTTP.example host: host, ip_addresses: [ip_address]
    connect_http.read_timeout = 0.1

    get = EventStore::Cluster::LeaderStatus::GossipEndpoint::Get.build connect_http

    test "Non-cluster error is raised" do
      assert proc { get.() } do
        raises_error? EventStore::Cluster::LeaderStatus::GossipEndpoint::Get::NonClusterError
      end
    end
  end

  unless ENV['DISABLE_SLOW_TESTS'] == 'on'
    comment "The following test depends on a timeout being reached within EventStore. To disable, set ENV['DISABLE_SLOW_TESTS'] to 'on'"

    context "Read timeout on HTTP connection exceeds EventStore gossip endpoint tolerance" do
      connect_http = Controls::ConnectHTTP.example host: host, ip_addresses: [ip_address]

      get = EventStore::Cluster::LeaderStatus::GossipEndpoint::Get.build connect_http

      test "Non-cluster error is raised" do
        assert proc { get.() } do
          raises_error? EventStore::Cluster::LeaderStatus::GossipEndpoint::Get::NonClusterError
        end
      end
    end
  end
end
