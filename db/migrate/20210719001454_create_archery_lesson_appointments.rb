class CreateArcheryLessonAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :archery_lesson_appointments do |t|
      t.references :product

      t.datetime :start_time, null: false
      t.datetime :end_time, null: false

      t.timestamps
    end
  end
end
