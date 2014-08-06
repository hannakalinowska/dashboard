require 'celluloid'

module Airbrake
  class Project
    include Celluloid

    attr_reader :attrs

    def self.all
      AirbrakeAPI.projects.map do |p|
        project = Project.new(p)
        project.future.errors
        project
      end
    end

    def initialize(attrs = {})
      @attrs = attrs
    end

    def id
      @attrs['id']
    end

    def name
      attrs['name']
    end

    def error_count
      errors.size
    end

    def errors
      @errors ||= AirbrakeAPI.errors(project_id: id)
    end
  end
end
