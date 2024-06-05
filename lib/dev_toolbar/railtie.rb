module DevToolbar
  class Railtie < Rails::Railtie
    initializer "dev_toolbar.middleware" do |app|
      app.middleware.use DevToolbar::Middleware if Rails.env.development?
    end
  end
end
