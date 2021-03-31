Spree.config do |config|
  config.layout = 'application'
  config.admin_show_version = false
end

Spree.dependencies do |dependencies|
end

Spree.user_class = "Spree::User"
