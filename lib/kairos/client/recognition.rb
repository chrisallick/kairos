module Kairos
  module Client
    module Recognition
      
      def detect(opts={})
        opts.assert_valid_keys(:url)
        make_request(:detect, opts)
      end

    end
  end
end