module Spree
  class ArcheryLessonAppointmentsController < ApplicationController
    def index
      @lesson_appointments = ArcheryLessonAppointment.all

      render json: @lesson_appointments
    end

    def create
      lesson_appointment = ArcheryLessonAppointment.new(
        start_time: params[:start_time],
        end_time: params[:end_time],
        product: ::Spree::Product.first
      )

      if lesson_appointment.save
        redirect_to "/schedule"
      else
        redirect_to "/schedule", notice: "There was a problem: #{lesson_appointment.errors.full_messages.join(". ")}"
      end
    end
  end
end
