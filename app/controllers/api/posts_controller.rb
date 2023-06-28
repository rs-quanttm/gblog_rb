module Api
  class PostsController < Api::BaseController
    # jitera-anchor-dont-touch: before_action_filter

    # jitera-index-anchor-dont-touch: actions
    # def index
    #   @posts = PostsService::Index.new(params.to_unsafe_h, current_user).execute
    #   @total_pages = @posts.total_pages
    # end

    # jitera-show-anchor-dont-touch: actions
    def show
      post = params[:title]
      @post = Post.search_by_title(post)
      # show-authorization-code
    end

    # jitera-create-anchor-dont-touch: actions
    def create
      @post = Post.new(post_params)
      # create-authorization-code
      return if @post.save

      @error_object = @post.errors.full_messages
      render status: :unprocessable_entity
    end

    # jitera-update-anchor-dont-touch: actions
    # def update
    #   @post = Post.find(params[:id])
    #   # update-authorization-code
    #   return  if @post.update(post_params)

    #   @error_object = @post.errors.full_messages
    #   render status: :unprocessable_entity
    # end

    # jitera-destroy-anchor-dont-touch: actions
    # def destroy
    #   @post = Post.find(params[:id])
    #   # destroy-authorization-code
    #   if @post.destroy
    #     head :ok
    #   else
    #     head :unprocessable_entity
    #   end
    # end

    # jitera-anchor-dont-touch: actions

    private

    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end
  end
end
