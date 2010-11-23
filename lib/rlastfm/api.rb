require "httparty"
require "digest/md5"

module RLastFM
  class Api
    include HTTParty
    format :json

    class << self
      private

      # Constructs api method signature by first ordering all the parameters
      # sent in alphabetically by parameter name and concatenating them into one
      # string using a <name><value> scheme.
      #
      # So for a call to auth.getSession you may have:
      #   api_keyxxxxxxxxmethodauth.getSessiontokenxxxxxxx
      #
      # Then it appends the secret to that string. Finally, it generates a md5
      # hash of the resulting string.
      #
      # For example, for an account with a secret equal to 'mysecret', your api
      # signature will be:
      #   md5("api_keyxxxxxxxxmethodauth.getSessiontokenxxxxxxxmysecret")
      #
      # Returns a hash that has signature
      #
      def generate_signature(params)
        params[:api_key] = RLastFM::Config.api_key
        str = params.sort {|a, b| a[0].to_s <=> b[0].to_s}.join
        params[:api_sig] = Digest::MD5.hexdigest(str)
        params
      end

      ###
      def add_session_key(params)
        unless RLastFM::Config.session_key
          refresh_session_key!
        end

        params[:session_key] = RLastFM::Config.session_key
        params
      end

      ###
      def refresh_session_key!
      end

      def with_default_params(extra_params)
        {
          :api_key => RLastFM::Config.api_key,
          :format => "json"
        }.merge(extra_params)
      end

      def get(method, params = {})
        params[:method] = method

        super(
          RLastFM::Config.api_url, :query => with_default_params(params)
        ).parsed_response
      end
    end
  end
end
