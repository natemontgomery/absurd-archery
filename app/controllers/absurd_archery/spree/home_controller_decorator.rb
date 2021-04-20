module AbsurdArchery
  module Spree
    module HomeControllerDecorator
      def syllabus
        if http_cache_enabled?
          fresh_when etag: store_etag, last_modified: store_last_modified, public: true
        end
      end

      def schedule
        if http_cache_enabled?
          fresh_when etag: store_etag, last_modified: store_last_modified, public: true
        end
      end

      def about
        if http_cache_enabled?
          fresh_when etag: store_etag, last_modified: store_last_modified, public: true
        end
      end

      def contact
        if http_cache_enabled?
          fresh_when etag: store_etag, last_modified: store_last_modified, public: true
        end
      end
    end
  end
end

Spree::HomeController.prepend AbsurdArchery::Spree::HomeControllerDecorator
