module Kairos
  module Client
    module Utils

      class FaceError < StandardError; end

      API_METHODS = {
        :detect => 'http://api.kairos.io/detect',
      }

      def api_crendential
        { :app_id => app_id, :app_key => app_key }
      end

      def make_request(api_method, opts={})
        # if opts[:url].is_a? Array
        #   opts[:url] = opts[:url].join(',')
        # end

        # if opts[:uids].is_a? Array
        #   opts[:uids] = opts[:uids].join(',')
        # end
        
        # if opts[:tids].is_a? Array
        #   opts[:tids] = opts[:tids].join(',')
        # end

        # if opts[:pids].is_a? Array
        #   opts[:pids] = opts[:pids].join(',')
        # end
        
        # response = JSON.parse( RestClient.post(API_METHODS[ api_method ], opts.merge(api_crendential)).body )
        response = JSON.parse( RestClient::Request.execute(
          :method => :post,
          :url => API_METHODS[ api_method ],
          :headers => {
            "app_id" => app_id,
            "app_key" => app_key
          },
          :payload => opts.to_json
        ))
        
        if %w/success partial/.include?(response['status'])
          response
        elsif response['status'] == 'failure'
          raise FaceError.new("Error: #{response['error_code']}, #{response['error_message']}")
        end
      end

      def user_auth_param
        user_auth_value = []
        # if twitter_credentials
        #   twitter_credentials.each do |k, v|
        #     user_auth_value << "#{k}:#{v}"
        #   end
        # elsif twitter_oauth_credentials
        #   twitter_oauth_credentials.each do |k,v|
        #     user_auth_value << "#{k}:#{v}"
        #   end
        # end
        # if facebook_credentials
        #   facebook_credentials.each do |k, v|
        #     user_auth_value << "#{k}:#{v}"
        #   end
        # end
        user_auth_value.size > 0 ? { :user_auth => user_auth_value.join(',') } : {}
      end

    end
  end
end