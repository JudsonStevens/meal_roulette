class HomepagesController < ApplicationController
  def index
    render 'homepages/index'
  end

  def show
    if current_user
      arr = current_user.tag_users.where('preference < 1').joins(:tag).pluck(:type)
      @new_array = []
      Restaurant.all.each do |restaurant|
        y = restaurant.tags.pluck(:type).length
        x =  restaurant.tags.pluck(:type) - arr
        if x.length == y
          @new_array << restaurant.name
        end
      end
    else
      @new_array = Restaurant.all.take(10).map { |restaurant| restaurant.name }
    end
  end
end