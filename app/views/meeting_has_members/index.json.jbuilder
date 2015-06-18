json.array!(@meeting_has_members) do |meeting_has_member|
  json.extract! meeting_has_member, :id, :meeting_id, :member_id
  json.url meeting_has_member_url(meeting_has_member, format: :json)
end
