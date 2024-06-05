module DevToolbar
  class Railtie < Rails::Railtie
    initializer "dev_toolbar.configure_view_controller" do
      ActiveSupport.on_load(:action_controller) do
        include DevToolbar::ToolbarHelper
      end
    end

    initializer "dev_toolbar.assets" do |app|
      app.config.assets.precompile += %w(dev_toolbar.css dev_toolbar.js)
      app.config.assets.paths << File.expand_path('../../app/assets/stylesheets', __FILE__)
      app.config.assets.paths << File.expand_path('../../app/assets/javascripts', __FILE__)
    end
  end
end
