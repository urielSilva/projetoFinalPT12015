class MeetingHasMember < ActiveRecord::Base

  belongs_to :member
  belongs_to :meeting
  validates :meeting_mandatory,
            :presence => { :if => 'meeting_mandatory.nil?' }


  def teste
    @members = Member.all
  end

  def teste2
    @meetings = Meeting.all
  end

  def pega_membro
    teste
    @members.find(self.member_id).member_name if self.member_id
  end

  def pega_reuniao
    teste2
    @meetings.find(self.meeting_id).meeting_name if self.meeting_id
  end

end
