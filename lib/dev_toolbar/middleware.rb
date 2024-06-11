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
              <button id="dev-toolbar-toggle">🛠️</button>
            </div>
            <div id="dev-toolbar-links" class="hidden">
              #{toolbar_links}
            </div>
          </div>
          <style>
            #dev-toolbar {
              position: fixed;
              right: 5%;
              bottom: 50%;
              z-index: 1000;
              display: flex;
              flex-direction: column;
              align-items: center;
            }
        
            #dev-toolbar-toggle {
              font-size: 2em;
              background: none;
              border: none;
              padding: 0;
              cursor: pointer;
            }
        
            #dev-toolbar-links {
              display: flex;
              flex-direction: column;
              background: #fff;
              padding: 0.5rem;
              border: 3px solid #666666;
              border-radius: 10px;
              justify-content: center;
              align-items: flex-start;
              gap: 10px;
            }
        
            #dev-toolbar-links.hidden {
              display: none;
            }
        
            #dev-toolbar-links a {
              color: #808080;
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
        "<a href='#{link[:path]}' target='_blank'>#{link[:name]}</a>"
      end.join(' ')
    end
  end
end
