if @message.present?

  json.message @message

else

  json.total_pages @total_pages
  json.comments @comments do |comment|
    json.id comment.id
    json.created_at comment.created_at
    json.updated_at comment.updated_at
    json.content comment.content

    if comment.user.present?
      json.user do
        json.id comment.user.id
        json.created_at comment.user.created_at
        json.updated_at comment.user.updated_at
        json.email comment.user.email
        json.roles comment.user.role
      end
    end

    json.user_id comment.user_id

    if comment.post.present?
      json.post do
        json.id comment.post.id
        json.created_at comment.post.created_at
        json.updated_at comment.post.updated_at
        json.title comment.post.title
        json.content comment.post.content
        json.user_id comment.post.user_id
      end
    end

    json.post_id comment.post_id
  end

end
