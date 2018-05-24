class Admin::TagsController < ApplicationController
  before_action :admin?

  def index
    @tags = Tag.all
  end
end