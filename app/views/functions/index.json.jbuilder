json.array!(@functions) do |function|
  json.extract! function, :id, :function_name, :function_module, :function_url
  json.url function_url(function, format: :json)
end
