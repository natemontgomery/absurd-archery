module AbsurdArchery
  module Spree
    module ProductDecorator
      def self.prepended(base)
        base.has_many :archery_lesson_appointments,
                      class_name: 'ArcheryLessonAppointment',
                      foreign_key: 'product_id', dependent: :destroy
      end
    end
  end
end

if ::Spree::Product.included_modules.exclude?(AbsurdArchery::Spree::ProductDecorator)
  ::Spree::Product.prepend AbsurdArchery::Spree::ProductDecorator
end
