json.array!(@job_has_functions) do |job_has_function|
  json.extract! job_has_function, :id, :job_id, :function_id
  json.url job_has_function_url(job_has_function, format: :json)
end
