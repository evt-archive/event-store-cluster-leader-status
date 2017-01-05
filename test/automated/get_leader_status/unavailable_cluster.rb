require_relative '../automated_init'

context "Get Cluster Leader, Partially Available Cluster" do
  ip_addresses = Controls::IPAddress::Unavailable.list
  connect_http = Controls::ConnectHTTP.example ip_addresses: ip_addresses

  get_leader_status = EventStore::Cluster::LeaderStatus::Get.build connect_http

  test "Connection error is raised" do
    assert proc { get_leader_status.() } do
      raises_error? EventStore::HTTP::Connect::ConnectionError
    end
  end
end
