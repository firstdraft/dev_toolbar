module DevToolbar
  class ErdController < ActionController::Base
    layout false
    
    def show
      @erd_path = Rails.root.join("erd.png")
      render :show
    end
  end
end
