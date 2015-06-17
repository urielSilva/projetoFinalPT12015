class Member < ActiveRecord::Base

  validates :member_email, uniqueness: true
  validates :member_name, presence: true, length: { minimum: 2 }
  validates :member_password, presence: true, length: { minimum: 6 }

  has_one :job

  before_save :encrypt_password

  def encrypt_password
    self.member_password = Digest::MD5::hexdigest(self.member_password)
  end

  def teste
    @jobs = Job.all
  end

  def pega_job(id_pesq)
    teste
    @jobs.find(id_pesq).job_name
  end

end
