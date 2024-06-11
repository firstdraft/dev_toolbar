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
            <div id="dev-toolbar-button">
              <a id="dev-toolbar-toggle">🛠️</a>
            </div>
            <div id="dev-toolbar-links" class="hidden">
              #{toolbar_links}
            </div>
          </div>
          <style>
            #dev-toolbar {
              position: fixed;
              right: 0;
              top: 50vh;
              transform: translateY(-50%);
              background-color: #f0f0f0;
              border: 1px solid #ccc;
              z-index: 1000;
              display: flex;
              flex-direction: column;
              align-items: center;
              font-family: -apple-system, BlinkMacSystemFont, avenir next, avenir, segoe ui, helvetica neue, helvetica, Cantarell, Ubuntu, roboto, noto, arial, sans-serif;
              color: #808080;
            }
        
            #dev-toolbar-toggle {
              font-size: 2em;
              border: none;
              cursor: pointer;
              padding: 8px 10px;
              text-decoration: none;
            }
        
            #dev-toolbar-links {
              display: flex;
              flex-direction: column;
            }

            .dev-toolbar-link {
              padding: 5px 10px;
              border-bottom: 1px #f0f0f0 solid;
              color: #808080;
              text-decoration: none;
              background-color: white;
            }
        
            #dev-toolbar-links.hidden {
              display: none;
            }
          </style>
          <script>
            document.getElementById('dev-toolbar-toggle').addEventListener('click', function() {
              var links = document.getElementById('dev-toolbar-links');
              links.classList.toggle('hidden');
            });
          </script>
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
        "<a href='#{link[:path]}' target='_blank' class='dev-toolbar-link'>#{link[:name]}</a>"
      end.join(' ')
    end
  end
end
