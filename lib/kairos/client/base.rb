require File.expand_path('../utils', __FILE__)
require File.expand_path('../recognition', __FILE__)
#require File.expand_path('../tags', __FILE__)
#require File.expand_path('../accounts', __FILE__)

module Kairos
  module Client
    class Base
      
      attr_accessor :app_id, :app_key

      include Kairos::Client::Utils
      include Kairos::Client::Recognition
      # include Kairos::Client::Tags
      # include Kairos::Client::Accounts

      def initialize(opts={})
        opts.assert_valid_keys(:app_id, :app_key)
        @app_id, @app_key = opts[:app_id], opts[:app_key]
      end

    end
  end
end