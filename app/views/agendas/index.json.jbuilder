json.array!(@agendas) do |agenda|
  json.extract! agenda, :id, :agenda_name, :agenda_description, :agenda_date
  json.url agenda_url(agenda, format: :json)
end
