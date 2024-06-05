module DevToolbar
  module ToolbarHelper
    def dev_toolbar
      return unless Rails.env.development?

      content_tag(:div, id: 'dev-toolbar', style: 'position: fixed; right: 0; top: 0; background: #333; color: #fff; padding: 10px; z-index: 1000;') do
        links = [
          link_to('Routes', '/rails/info/routes', style: 'color: #fff; margin-right: 10px;'),
          link_to('Database', '/rails/db', style: 'color: #fff; margin-right: 10px;'),
          link_to('Web Console', '#', onclick: 'openWebConsole();', style: 'color: #fff; margin-right: 10px;')
        ].join.html_safe

        safe_join([links])
      end
    end
  end
end
