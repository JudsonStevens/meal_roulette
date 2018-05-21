class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  # GET /tags/new
  def new
    @user = User.find_by(id: session[:user_id])
    @tag = @user.tags.new
    @tag_users = @tag.tag_users.new
    # @tag_users = @user.tag_users.build
    # @tag = @tag_users.build_tag
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    tag = Tag.create!(type: tag_params[:type])
    @tag_user = tag.tag_users.new(user_id: params[:user_id], preference: tag_params[:tag_users_attributes]["0"][:preference])
    respond_to do |format|
      if @tag_user.save
        format.html { redirect_to user_path(@tag_user.user_id), notice: 'Tag was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:type, tag_users_attributes: [:preference])
    end
end
