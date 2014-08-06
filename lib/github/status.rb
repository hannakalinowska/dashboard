require 'celluloid'

module Github
  class Status
    include Celluloid

    def initialize
      self.future.fetch_data
    end

    def status
      data['status']
    end

    def message
      data['body']
    end

    def data
      return @data if defined?(@data)

      response = open('https://status.github.com/api/last-message.json')
      @data = JSON.parse(response.read)
    end
  end
end
