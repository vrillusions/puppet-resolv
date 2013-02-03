VERBOSE=true
require 'rake'

require 'rspec/core/rake_task'

require 'puppet-lint/tasks/puppet-lint'
# fail on warnings
PuppetLint.configuration.fail_on_warnings = true

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end

task :default => [:spec, :lint]
