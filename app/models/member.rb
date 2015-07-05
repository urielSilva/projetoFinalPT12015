class Member < ActiveRecord::Base

  has_one :job
  has_many :meeting_has_members, dependent: :destroy
  has_many :meetings, through: :meeting_has_members

  accepts_nested_attributes_for :meeting_has_members,
                                allow_destroy: true
  accepts_nested_attributes_for :meetings

  validates :member_email,
            uniqueness: true, presence: true
  validates :member_name,
            presence: true,
            length: { minimum: 2, maximum: 100 }
  validates :member_password,
            presence: true,
            length: { minimum: 6 }

  before_save :encrypt_password

  def encrypt_password
    self.member_password = Digest::MD5::hexdigest(self.member_password)
  end

  def teste
    @jobs = Job.all
  end

  def teste2
    @meeting_has_members = MeetingHasMember.all
  end

  def pega_job
    teste
    @jobs.find(self.job_id).job_name if self.job_id
  end

  def auth(password)
    password = Digest::MD5::hexdigest(password)
    self.member_password==password
  end

  def reuniao_vazio?
     if self.meeting_has_members.count == 0
     end
  end

end
