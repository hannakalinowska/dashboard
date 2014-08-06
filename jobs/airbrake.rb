require 'benchmark'
require_relative '../lib/airbrake'

SCHEDULER.every '10s' do
  errors = Array.new

  projects = Airbrake::Project.all

  projects.each do |project|
    errors << { label: project.name, value: project.error_count }
  end

  send_event('airbrake', { items: errors })
end

