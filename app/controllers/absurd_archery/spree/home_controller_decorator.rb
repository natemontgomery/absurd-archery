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

        # Scope your query to the dates being shown:
        start_date = params.fetch(:start_date, Date.today).to_date
        @lesson_appointments = ArcheryLessonAppointment.where(
          start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week
        )
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
