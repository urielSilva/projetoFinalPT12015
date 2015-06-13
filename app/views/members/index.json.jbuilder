json.array!(@members) do |member|
  json.extract! member, :id, :member_name, :member_email, :member_password
  json.url member_url(member, format: :json)
end
