module RLastFM
  autoload :Api, File.dirname(__FILE__) + "/rlastfm/api"
  autoload :Album, File.dirname(__FILE__) + "/rlastfm/album"

  class Config
    class << self
      attr_accessor :api_key, :api_secret, :api_url, :session_key

      def api_url
        @api_url ||= "http://ws.audioscrobbler.com/2.0/"
      end
    end
  end
end
