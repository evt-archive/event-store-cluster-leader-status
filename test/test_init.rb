ENV['CONSOLE_DEVICE'] ||= 'stdout'
ENV['LOG_LEVEL'] ||= '_min'

puts RUBY_DESCRIPTION

require_relative '../init.rb'
require 'event_store/clustering/controls'

require 'test_bench'; TestBench.activate

require_relative './fixtures/fixtures_init'

require 'pp'

Net::HTTP.send :const_set, :Assertions, EventStore::HTTP::Connect::NetHTTP::Assertions

Controls = EventStore::Clustering::Controls

EventStore::HTTP::Connect::Controls::IPAddress::Loopback::Alias::VerifyAll.() or exit 1
