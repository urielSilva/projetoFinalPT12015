json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :name_meeting, :description_meeting, :date_meeting
  json.url meeting_url(meeting, format: :json)
end
