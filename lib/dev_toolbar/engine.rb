module DevToolbar
  class Engine < ::Rails::Engine
    isolate_namespace DevToolbar

    routes.draw do
      get "/erd", to: "erd#show"
    end
  end
end
