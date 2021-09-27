module Spree
  class ArcheryLessonAppointmentsController < Spree::ProductsController
    include Spree::Core::ControllerHelpers
    include Spree::Core::ControllerHelpers::Store
    include Spree::Core::ControllerHelpers::Currency

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
