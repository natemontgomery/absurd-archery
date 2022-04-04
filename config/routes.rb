Rails.application.routes.draw do
  mount Spree::Core::Engine, at: '/'
end

Spree::Core::Engine.routes.draw do
  get '/syllabus' => 'home#syllabus'
  get '/schedule' => 'home#schedule'
  get '/about' => 'home#about'
  get '/contact' => 'home#contact'
  get '/terms' => 'home#terms'

  post 'products/:id', to: 'store#ensure_cart'
end
