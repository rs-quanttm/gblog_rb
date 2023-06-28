if @error_object.present?

  json.error_object @error_object

else

  json.user do
    json.id @user.id
    json.created_at @user.created_at
    json.updated_at @user.updated_at
    json.email @user.email

    json.posts @user.posts do |post|
      json.id post.id
      json.created_at post.created_at
      json.updated_at post.updated_at
      json.title post.title
      json.content post.content
      json.user_id post.user_id
    end

    json.roles @user.role

    json.comments @user.comments do |comment|
      json.id comment.id
      json.created_at comment.created_at
      json.updated_at comment.updated_at
      json.content comment.content
      json.user_id comment.user_id
    end

    json.likes @user.likes do |like|
      json.id like.id
      json.created_at like.created_at
      json.updated_at like.updated_at
      json.user_id like.user_id
    end
  end

end
