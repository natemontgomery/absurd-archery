module Spree
  class ArcheryLessonAppointmentsController < ApplicationController
    include Spree::Core::ControllerHelpers
    include Spree::Core::ControllerHelpers::Store
    include Spree::Core::ControllerHelpers::Currency

    rescue_from ActiveRecord::RecordNotFound, with: :render_404

    helper 'spree/taxons'
    helper Spree::Core::Engine.helpers

    def index
      @lesson_appointments = ArcheryLessonAppointment.all

      render json: @lesson_appointments
    end

    def new
      @product = ArcheryLessonAppointment.new(
        start_time: params[:start_time],
        end_time: params[:end_time],
        product: ::Spree::Product.first
      ).product

      # @product_images = @product.images
      # @variants = @product.variants
      # @product_price = @product.price

      @variants = @product.variants_including_master.active(current_currency).includes([:option_values, :images])
      @product_properties = @product.product_properties.includes(:property)

      render :show
    end

    def create
    end
  end
end
