ENV['CONSOLE_DEVICE'] ||= 'stdout'
ENV['LOG_LEVEL'] ||= '_min'

puts RUBY_DESCRIPTION

require_relative '../init.rb'
require 'event_store/cluster/leader_status/controls'

require 'test_bench'; TestBench.activate

require_relative './fixtures/fixtures_init'

require 'pp'

Net::HTTP.send :const_set, :Assertions, EventStore::HTTP::Connect::NetHTTP::Assertions

Controls = EventStore::Cluster::LeaderStatus::Controls

EventStore::HTTP::Connect::Controls::IPAddress::Loopback::Alias::VerifyAll.() or exit 1
