json.array!(@members) do |member|
  json.extract! member, :id, :name_member, :email_member, :password_member
  json.url member_url(member, format: :json)
end
