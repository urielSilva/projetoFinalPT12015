json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :meeting_name, :meeting_description, :meeting_date
  json.url meeting_url(meeting, format: :json)
end
