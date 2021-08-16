# Runs with db:seed or db:setup

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

shipping_seed = Spree::ShippingCategory.create!(name: "In Person")

lesson_product = ::Spree::Product.create!(
  name: "Single Lesson",
  description: "A single archery lesson",
  available_on: Time.zone.now,
  slug: "single-lesson",
  promotionable: true,
  shipping_category_id: shipping_seed.id
)

::Spree::Price.create!(variant_id: lesson_product.id, amount: 50, currency: "USD")
