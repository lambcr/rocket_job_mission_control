$:.push File.expand_path("lib", __dir__)

require "rocket_job_mission_control/version"

Gem::Specification.new do |s|
  s.name                  = "rocketjob_mission_control"
  s.version               = RocketJobMissionControl::VERSION
  s.authors               = ["Michael Cloutier", "Chris Lamb", "Jonathan Whittington", "Reid Morrison"]
  s.homepage              = "https://rocketjob.io"
  s.summary               = "Ruby's missing batch system."
  s.description           = "Rocket Job Mission Control is the Web user interface to manage Rocket Job."
  s.license               = "Apache-2.0"
  s.required_ruby_version = ">= 2.5"

  s.files      = Dir["{app,config,db,lib,vendor}/**/*", "LICENSE.txt", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "access-granted", "~> 1.3"
  s.add_dependency "railties", ">= 5.0"
  s.add_dependency "rocketjob", "~> 6.0"
  s.add_dependency "amazing_print", "~> 1.3"
  s.add_dependency "turbolinks", "~> 5"
end
