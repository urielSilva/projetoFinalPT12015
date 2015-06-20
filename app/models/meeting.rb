class Meeting < ActiveRecord::Base

  has_one :agenda
  has_many :meeting_has_members
  has_many :members, through: :meeting_has_members

  accepts_nested_attributes_for :meeting_has_members,
                                reject_if: proc { |attributes| attributes['member_id'].blank? },
                                allow_destroy: true
  accepts_nested_attributes_for :members

  validates :meeting_name, presence: true, length: { maximum: 100 }
  validates :meeting_description, length: { maximum: 255 }
  validates :agenda_id, presence: true


  def teste
    @agendas = Agenda.all
  end

  def teste2
    @meeting_has_members = MeetingHasMember.all
  end

  def pega_nome
    teste
    @agendas.find(self.agenda_id).agenda_name if self.agenda_id
  end

  def pega_relacao
    teste2
    @meeting_has_members.find_by meeting_id: self.id
  end

end
