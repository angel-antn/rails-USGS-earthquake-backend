json.id @earthquake.id
json.type @earthquake.type
json.attributes do
  json.external_id @earthquake.external_id
  json.magnitude @earthquake.magnitude
  json.place @earthquake.place
  json.time @earthquake.time
  json.tsunami @earthquake.tsunami
  json.mag_type @earthquake.mag_type
  json.title @earthquake.title
  json.coordinates do
    json.longitude @earthquake.longitude
    json.latitude @earthquake.latitude
  end
end
json.links do
  json.external_url @earthquake.external_url
end
json.comments do
  json.array!(@earthquake.comments) do |comment|
    json.body comment.body
  end
end