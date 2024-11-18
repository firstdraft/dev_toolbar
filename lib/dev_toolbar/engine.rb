module DevToolbar
  class Engine < ::Rails::Engine
    isolate_namespace DevToolbar
    
    initializer "dev_toolbar.add_routes", after: :add_routing_paths do |app|
      app.routes.append do
        get "/erd", to: "dev_toolbar/erd#show"
      end
    end
  end
end
