class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  def index
    @posts = Post.all
  end

  def new
    if params[:back]
      @post = Post.new(posts_params)
    else
      @post = Post.new
    end
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to posts_path, notice: '正常に投稿しました'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(posts_params)
      redirect_to posts_path, notice: '投稿を更新しました'
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: '投稿を削除しました'
  end

  def confirm
    @post = Post.new(posts_params)
    render :new if @post.invalid?
  end

private

  def posts_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
