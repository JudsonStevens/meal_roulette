class HomepagesController < ApplicationController
  def index
    render 'homepages/index'
  end

  def show
    if current_user

    end
  end
end