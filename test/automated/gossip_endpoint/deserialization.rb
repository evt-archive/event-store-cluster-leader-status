require_relative '../automated_init'

context "Gossip Endpoint Deserialization" do
  json_text = Controls::GossipEndpoint::Response::JSON.text

  response = Transform::Read.(
    json_text,
    :json,
    EventStore::Clustering::GossipEndpoint::Response
  )

  test "Leader IP address" do
    assert response.leader_ip_address == Controls::IPAddress::Leader.example
  end
end
