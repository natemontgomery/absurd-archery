module Spree
  class ArcheryLessonAppointmentsController < ApplicationController
    include Spree::Core::ControllerHelpers
    include Spree::Core::ControllerHelpers::Store
    include Spree::Core::ControllerHelpers::Currency
    helper Spree::Core::Engine.helpers

    def index
      @lesson_appointments = ArcheryLessonAppointment.all

      render json: @lesson_appointments
    end

    def create
      @product = ArcheryLessonAppointment.new(
        start_time: params[:start_time],
        end_time: params[:end_time],
        product: ::Spree::Product.first
      ).product

      @product_images = @product.images
      @variants = @product.variants
      @product_price = @product.price

      render :show
    end
  end
end
