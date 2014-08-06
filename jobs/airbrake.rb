require 'benchmark'
require_relative '../lib/airbrake'

SCHEDULER.every '10m' do
  errors = Array.new

  projects = Airbrake::Project.all

  projects.each do |project|
    errors << { label: project.name, value: project.error_count }
  end

  projects.map(&:terminate)

  send_event('airbrake', { items: errors })
end

