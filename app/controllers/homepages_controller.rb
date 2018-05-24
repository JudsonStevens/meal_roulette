class HomepagesController < ApplicationController
  def index
    render 'homepages/index'
  end

  def show
    if current_user
      user = User.find(current_user)
      user.tag_users.where('preference < 1').map { |tag_user| tag_user.tag.type }
        
      
    else
      @new_array = Restaurant.all.take(10).map { |restaurant| restaurant.name }
    end
  end
end