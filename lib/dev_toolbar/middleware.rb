module DevToolbar
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      if Rails.env.development? && headers["Content-Type"]&.include?("text/html")
        response_body = response.body
        toolbar_html = <<-HTML
          <meta name="dev_toolbar_config" content='#{toolbar_links_content}'>
        HTML

        response_body.sub!('</head>', "#{toolbar_html}</head>")
        headers["Content-Length"] = response_body.bytesize.to_s

        response = [response_body]
      end

      [status, headers, response]
    end

    private

    def toolbar_links_content
      JSON.generate(DevToolbar.configuration.links)
    end
  end
end
