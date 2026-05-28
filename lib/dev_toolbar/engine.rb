module DevToolbar
  class Engine < ::Rails::Engine
    isolate_namespace DevToolbar

    initializer "dev_toolbar.assets_precompile", group: :all do |app|
      # Only configure asset precompilation if Sprockets is available
      if defined?(Sprockets) && app.config.respond_to?(:assets)
        app.config.assets.precompile += ["dev_toolbar/index.js"]
      end
    end

    initializer "dev_toolbar.add_static_assets_middleware" do |app|
      app.middleware.use ::Rack::Static,
        # the url prefix to intercept
        urls: ["/dev_toolbar"],
        root: "#{root}/app/"
    end

    initializer "dev_toolbar.importmap", before: "importmap" do |app|
      if defined?(Importmap)
        app.config.importmap.paths << root.join("config/importmap.rb")
      end
    end

    initializer "dev_toolbar.add_routes", after: :add_routing_paths do |app|
      app.routes.append do
        get "/erd", to: "dev_toolbar/erd#show"
      end
    end
  end
end
