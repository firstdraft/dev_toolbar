module DevToolbar
  class Railtie < Rails::Railtie
    initializer "dev_toolbar.configure_view_controller" do
      ActiveSupport.on_load(:action_controller) do
        ActionController::Base.helper DevToolbar::ToolbarHelper
      end
    end
  end
end
