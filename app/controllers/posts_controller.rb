class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    #menampilkan semua post yang telah tesimpan
    def index
      @posts = Post.all
    end

    def show
    end
  
    def edit
    end
  
    #membuat postingan baru
    def new
      @posts = Post.new
    end
  
    #menghandle request create data
    def create
        @posts = Post.new(post_params)
        respond_to do |format|
          if @posts.save
            format.html { redirect_to @posts, notice: 'Post was successfully created.' }
            format.json { render :show, status: :created, location: @posts }
          else
            format.html { render :new }
            format.json { render json: @posts.errors, status: :unprocessable_entity }
          end
        end
      end
  
    #menghandle request update data
    def update
        respond_to do |format|
          if @posts.update(post_params)
            format.html { redirect_to @posts, notice: 'Post was successfully updated.' }
            format.json { render :show, status: :ok, location: @posts }
          else
            format.html { render :edit }
            format.json { render json: @posts.errors, status: :unprocessable_entity }
          end
        end
      end
  
    #menghandle request delete
    def destroy
        @posts.destroy
        respond_to do |format|
          format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
  
      private
    
  def set_post
    @posts = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
