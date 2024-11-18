module DevToolbar
  class Engine < ::Rails::Engine
    isolate_namespace DevToolbar
    
    initializer "dev_toolbar.routes", after: :load_config_initializers do
      Rails.application.routes.append do
        mount DevToolbar::Engine, at: "/"
      end
    end

    routes.draw do
      get "/erd", to: "erd#show"
    end
  end
end
