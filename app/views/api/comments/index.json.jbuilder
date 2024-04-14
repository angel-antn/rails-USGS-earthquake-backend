json.comments do
  json.array!(@comments) do |comment|
    json.id comment.id
    json.body comment.body
    json.user_name comment.user.name
    json.user_lastname comment.user.lastname
  end
end

