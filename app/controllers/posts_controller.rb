class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at:'desc')
  end

  def show
    @post= Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    @post.save
   flash[:notice] = "タスク「#{@post.title}」を登録しました。"
    redirect_to "/" 
  end
  
  def update
     @post = Post.new(post_params)
    @post.save
   flash[:notice] = "タスク「#{@post.title}」を編集しました。"
    redirect_to "/" 
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "タスク「#{@post.title}」を削除しました。"
    redirect_to "/" 
  end
  
  private
  def post_params
   params.require(:post).permit(:title,:description)
  end
end
