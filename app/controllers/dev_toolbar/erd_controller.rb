module DevToolbar
  class ErdController < ActionController::Base
    layout false
    
    def show
      @erd_path = Rails.root.join("erd.png")
      render "dev_toolbar/erd/show", formats: [:html]
    end
  end
end
