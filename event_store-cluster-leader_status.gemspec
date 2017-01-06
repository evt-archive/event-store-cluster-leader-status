# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'evt-event_store-cluster-leader_status'
  s.version = '0.0.0.1'
  s.summary = "Cluster leader status support for EventStore"
  s.description = ' '

  s.authors = ['The Eventide Project']
  s.email = 'opensource@eventide-project.org'
  s.homepage = 'https://github.com/eventide-project/event-store-clustering'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.3.3'

  s.add_runtime_dependency 'evt-event_store-http-connect'
  s.add_runtime_dependency 'evt-identifier-uuid'
  s.add_runtime_dependency 'evt-schema'
  s.add_runtime_dependency 'evt-transform'

  s.add_development_dependency 'test_bench'
end
