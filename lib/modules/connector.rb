require 'httparty'

module BoredContext

  class Connector
    attr_accessor :url
    attr_accessor :request_number

    def initialize(url, request_number)
      @url = url
      @request_number = request_number
    end

    def make_get_request
      @request_number.times do
        response = HTTParty.get(@url)

        handle_data_for_activity(response.body)
      end
    end

    def handle_data_for_activity(response_body)
      begin
        body_data = JSON.parse(response_body)
      rescue JSON::ParserError
        puts "ERROR: Recived invalid JSON"
      else
        Activity.new(body_data)
      end
    end
  end


  class Activity
    attr_accessor :count

    @count = 0

    def initialize(params)
      @activity = params
      p "Activity params"
      p @activity
      p "Participants:"
      p params["participants"]
      handle_counter(params)
    end

    #
    def handle_counter(params)
      if params["participants"] == 1
        Counter.new
      end
    end

  end

  class Counter
    attr_accessor :count

    @@activity_count = 0

    def initialize
      @@activity_count += 1
    end

    def self.count
      @@activity_count
    end
  end

  connector = Connector.new("https://www.boredapi.com/api/activity", 5)
  connector.make_get_request
  p "Number of activities with participant number equal to 1 is:"
  p Counter.count
end







