class MeetingHasMember < ActiveRecord::Base

  belongs_to :member
  belongs_to :meeting

  def teste
    @members = Member.all
  end

  def teste2
    @meetings = Meeting.all
  end

  def pega_membro(id_busca)
    teste
    @members.find(id_busca).member_name
  end

  def pega_reuniao(id_busca)
    teste2
    @meetings.find(id_busca).meeting_name
  end

end
