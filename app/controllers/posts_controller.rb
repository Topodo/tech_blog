class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order(visits_count: :desc)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post.update_visits_count
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        flash[:create_action] = 'Post creado exitosamente'
        format.html { redirect_to @post, notice: 'Post creado exitosamente' }
        format.json { render :show, status: :created, location: @post }
      else
        flash[:errors] = @post.errors.full_messages
        format.html { redirect_to new_topic_post_path(post_params[:topic_id]) }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(put_params)
        flash[:update_action] = "Post actualizado exitosamente"
        format.html { redirect_to @post, notice: 'Post actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @post }
      else
        flash[:update_errors] = @post.errors.full_messages 
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      flash[:delete_action] = "Post eliminado correctamente"
      format.html { redirect_to user_posts_path(current_user), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :author, :topic_id)
    end

    def put_params
      params.require(:post).permit(:title, :body)
    end
end
