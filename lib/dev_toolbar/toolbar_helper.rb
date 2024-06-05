module DevToolbar
  module ToolbarHelper
    def dev_toolbar
      return unless Rails.env.development?

      links = DevToolbar.configuration.links.map do |link|
        link_to(
          link[:name], 
          link[:path],
          style: "color: #fff; margin-right: 0.5rem;",
          target: "_blank",
        )
      end.join.html_safe

      content_tag(
        :div, 
        links, 
        id: "dev-toolbar", 
        style: "position: fixed; right: 0; top: 0; background: #333; color: #fff; padding: 0.5rem; z-index: 1000;",
      )
    end
  end
end
