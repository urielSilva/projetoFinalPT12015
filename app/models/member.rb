class Member < ActiveRecord::Base

  has_one :job

  def teste
    @jobs = Job.all
  end

  def pega_job(id_pesq)
    teste
    @jobs.find(id_pesq).job_name
  end

end
