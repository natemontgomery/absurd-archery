module AbsurdArchery
  module Spree
    module ProductsControllerDecorator
      def index
        @lesson_appointments = ArcheryLessonAppointment.all
        render json: @lesson_appointments
      end

      def show
        @product = ArcheryLessonAppointment.new(
          start_time: params[:start_time],
          end_time: params[:end_time],
          product: ::Spree::Product.find_by(name: "Single Lesson")
        ).product

        super
      end
    end
  end
end

Spree::ProductsController.prepend AbsurdArchery::Spree::ProductsControllerDecorator
