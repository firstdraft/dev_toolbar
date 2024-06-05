module DevToolbar
  module ToolbarHelper
    def dev_toolbar
      return unless Rails.env.development?

      links = DevToolbar.configuration.links.map do |link|
        link_to(link[:name], link[:path])
      end.join.html_safe

      content_tag(:div, links, id: 'dev-toolbar')
    end
  end
end
