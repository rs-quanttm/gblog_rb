module Api
  class CommentsController < Api::BaseController
    # jitera-anchor-dont-touch: before_action_filter

    # jitera-index-anchor-dont-touch: actions
    def index
      @comments = CommentsService::Index.new(params.to_unsafe_h, current_user).execute
      @total_pages = @comments.total_pages
    end

    # jitera-show-anchor-dont-touch: actions
    def show
      @comment = Comment.find(params[:id])
      # show-authorization-code
    end

    # jitera-create-anchor-dont-touch: actions
    def create
      @comment = Comment.new(create_params)
      # create-authorization-code
      return if @comment.save

      @error_object = @comment.errors.full_messages
      render status: :unprocessable_entity
    end

    # jitera-update-anchor-dont-touch: actions
    def update
      @comment = Comment.find(params[:id])
      # update-authorization-code
      return if @comment.update(update_params)

      @error_object = @comment.errors.full_messages
      render status: :unprocessable_entity
    end

    # jitera-destroy-anchor-dont-touch: actions

    # jitera-anchor-dont-touch: actions

    private

    def update_params
      params.require(:comments).permit(:content, :user_id, :post_id)
    end

    def create_params
      params.require(:comments).permit(:content, :user_id, :post_id)
    end
  end
end
