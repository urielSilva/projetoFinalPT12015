json.array!(@jobs) do |job|
  json.extract! job, :id, :name_job
  json.url job_url(job, format: :json)
end