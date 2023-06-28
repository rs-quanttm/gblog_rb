if @message.present?

  json.message @message

else

  json.post do
    # json.id @post.id
    # json.created_at @post.created_at
    # json.updated_at @post.updated_at
    json.title @post.title
    json.content @post.content

    if @post.user.present?
      json.user do
        # json.id @post.user.id
        json.created_at @post.user.created_at
        json.updated_at @post.user.updated_at
        json.email @post.user.email
      end
    end

    json.user_id @post.user_id

    json.comments @post.comments do |comment|
      # json.id comment.id
      json.created_at comment.created_at
      json.updated_at comment.updated_at
      json.content comment.content
      # json.user_id comment.user_id
      # json.post_id comment.post_id
    end

    json.likes @post.likes do |like|
      # json.id like.id
      json.created_at like.created_at
      json.updated_at like.updated_at
      json.user_id like.user_id
      # json.post_id like.post_id
    end

    json.posttaggings @post.posttaggings do |posttagging|
      json.id posttagging.id
      json.created_at posttagging.created_at
      json.updated_at posttagging.updated_at
      json.post_id posttagging.post_id
    end

    json.status @post.status
  end

end
