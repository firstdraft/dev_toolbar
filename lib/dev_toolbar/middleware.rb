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
            <div id="dev-toolbar-title">Development Links</div>
            #{toolbar_links}
          </div>
          <style>
            #dev-toolbar {
              position: fixed;
              right: 2%;
              bottom: 2%;
              background: #fff;
              color: #000;
              padding: 0.5rem;
              z-index: 1000;
              border: 0.2rem solid red;
              border-radius: 0.6rem;
              font-weight: bold;
            }
      
            #dev-toolbar a {
              text-decoration: underline;
              color: #000;
              margin-right: 0.6rem;
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
