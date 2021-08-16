Rails.application.routes.draw do
  mount Spree::Core::Engine, at: '/'
end

Spree::Core::Engine.routes.draw do
  get '/syllabus' => 'home#syllabus'
  get '/schedule' => 'home#schedule'
  get '/about' => 'home#about'
  get '/contact' => 'home#contact'

  resources :archery_lesson_appointments
end
