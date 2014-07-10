module Kairos
  module Client
    module Utils

      class FaceError < StandardError; end

      API_METHODS = {
        :detect => 'http://api.kairos.io/detect',
        :enroll => 'http://api.kairos.io/entroll',
        :recognize => 'http://api.kairos.io/recognize',
        :gallery_list_all => 'http://api.kairos.io/gallery/list_all',
        :gallery_view => 'http://api.kairos.io/gallery/view',
        :gallery_remove_subject => 'http://api.kairos.io/gallery/remove_subject',
      }

      def api_crendential
        { :app_id => app_id, :app_key => app_key }
      end

      def make_request(api_method, opts={})        
        response = JSON.parse( RestClient::Request.execute(
          :method => :post,
          :url => API_METHODS[ api_method ],
          :headers => {
            "app_id" => app_id,
            "app_key" => app_key
          },
          :payload => opts.to_json
        ))
        
        # if %w/success partial/.include?(response['status'])
        return response
        # elsif response['status'] == 'failure'
        #   raise FaceError.new("Error: #{response['error_code']}, #{response['error_message']}")
        # end
      end

      def user_auth_param
        user_auth_value = []
        user_auth_value.size > 0 ? { :user_auth => user_auth_value.join(',') } : {}
      end

    end
  end
end