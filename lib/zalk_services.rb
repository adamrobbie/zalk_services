require "zalk_services/version"
require "rest_client"

module ZalkServices
  class Client
    URL_MAP = {
      notify_tracking: "http://notify-tracking.herokuapp.com/"
    }

    def initialize(options = {})
      @access_token = ENV['INTERNAL_APP_SECRET']

      @url = base_url(options[:service])

      @resource = RestClient::Resource.new @url, content_type: :json, accepts: :json
    end

    attr_accessor :access_token, :resource

    def get_user_tracking(params)
      raise ClientError, 'missing params' if params.nil? || params.blank?
      get('/users/' + params.to_s)
    end
    
     private

      def get(params)
        @resource[params].get access_token: @access_token
      end

      def base_url(service)
        @base_url = URL_MAP.fetch(service) { raise ClientError, "missing service url in hash map"}
      end
  end


  class ClientError < StandardError
  end
end
