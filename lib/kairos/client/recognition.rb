module Kairos
  module Client
    module Recognition

      def enroll(opts={})
        opts.assert_valid_keys(:url, :subject_id, :gallery_name)
        make_request(:enroll, opts)
      end

      def recognize(opts={})
        opts.assert_valid_keys(:url, :gallery_name, :threshold, :max_num_results)
        make_request(:recognize, opts)
      end

      def detect(opts={})
        opts.assert_valid_keys(:url)
        make_request(:detect, opts)
      end

      def gallery_list_all()
        make_request(:gallery_list_all)
      end

      def gallery_view(opts={})
        opts.assert_valid_keys(:gallery_name)
        make_request(:gallery_view, opts)
      end

      def gallery_remove_subject(opts={})
        opts.assert_valid_keys(:gallery_name, :subject_id)
        make_request(:gallery_remove_subject, opts)
      end

    end
  end
end