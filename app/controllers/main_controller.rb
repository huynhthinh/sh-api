class MainController < ApplicationController
  def index
    render file: Rails.root.join('app','frontend','index.html'), layout:true
  end
end
