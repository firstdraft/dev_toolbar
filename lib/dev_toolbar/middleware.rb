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
          <div id="dev-toolbar">
            <div id="dev-toolbar-title">AppDev Toolbar</div>
            #{toolbar_links}
          </div>
          <style>
            #dev-toolbar {
              position: fixed;
              right: 10px;
              bottom: 10px;
              background: white;
              color: black;
              padding: 0.5rem;
              z-index: 1000;
              border: 3px solid red;
              border-radius: 10px;
            }
      
            #dev-toolbar a {
              color: black;
              margin-right: 10px;
            }

            #dev-toolbar-title {
              text-align: center;
              font-weight: bold;
            }
          </style>
        HTML

        response_body.sub!('</body>', "#{toolbar_html}</body>")
        headers["Content-Length"] = response_body.bytesize.to_s

        response = [response_body]
      end

      [status, headers, response]
    end

    private

    def toolbar_links
      DevToolbar.configuration.links.map do |link|
        "<a href='#{link[:path]}' target='_blank'>#{link[:name]}</a>"
      end.join(' ')
    end
  end
end
