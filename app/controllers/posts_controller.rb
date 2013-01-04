class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new,:create]
  
  def index
    @posts = Post.order("created_at DESC").page(params[:page]).per(2)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.create(params[:post])
    if @post.save
      redirect_to root_path, notice: "Post created succesfully"
     else
      redirect_to @posts, notice: "error"
    end
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  def load_file
    if @file_data
      FileUtils.mkdir_p post_images
      File.open(photo_filename, "wb") do |f|
        f.write(@file_data.read)
      end
      @file_data = nil
    end
    respond_to do |format|
      format.js
    end
  end
end
