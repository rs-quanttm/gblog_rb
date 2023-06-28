if @error_object.present?

  json.error_object @error_object

else
  json.tag do
    json.id @tag.id
    json.created_at @tag.created_at
    json.updated_at @tag.updated_at
    json.content @tag.content
  end
end