require 'httparty'

module BoredContext

  class Connector
    attr_accessor :url
    attr_accessor :request_number

    def initialize(url, request_number)
      @url = url
      @request_number = request_number
    end

    # Connection to URL
    # In every step it should create Activity
    def make_get_request
      @request_number.times do
        response = HTTParty.get(@url)
        p response.body
      end
    end
  end


  class Activity
    # def initiliaze
    #   #When variable     "participants": 1,
    #   # call counter
    #   # if not return
    #   # end
    # end
  end

  class Counter
    # @@count
  end
  connector = Connector.new("https://www.boredapi.com/api/activity", 5)
  connector.make_get_request

end


#TODO here it should take connection to bored api







