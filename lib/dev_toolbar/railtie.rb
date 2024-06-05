module DevToolbar
  class Railtie < Rails::Railtie
    initializer "dev_toolbar.configure_view_controller" do
      ActiveSupport.on_load(:action_controller) do
        include DevToolbar::ToolbarHelper
      end
    end

    initializer "dev_toolbar.assets" do |app|
      app.config.assets.precompile += %w(dev_toolbar.css dev_toolbar.js)
      app.config.assets.paths << root.join("app", "assets", "stylesheets")
      app.config.assets.paths << root.join("app", "assets", "javascripts")
    end
  end
end
