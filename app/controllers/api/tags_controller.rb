module Api
  class TagsController < Api::BaseController

    def create
      @tag = Tag.new(tag_params)
      return if @tag.save

      @error_object = @post.errors.full_messages
      render status: :unprocessable_entity
    end

    private

    def tag_params
      params.require(:tag).permit(:content)
    end
  end
end