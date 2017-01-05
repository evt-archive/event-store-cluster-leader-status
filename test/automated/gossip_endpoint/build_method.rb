require_relative '../automated_init'

context "Get Gossip Endpoint Build Method" do
  context "HTTP connect instance is specified" do
    connect_http = EventStore::HTTP::Connect.build

    get = EventStore::Cluster::LeaderStatus::GossipEndpoint::Get.build connect_http

    test "Specified instance is used" do
      assert get.connect_http.equal?(connect_http)
    end
  end
end
