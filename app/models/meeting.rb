class Meeting < ActiveRecord::Base

  has_one :agenda
  has_many :members, through: :meeting_has_members

  validates :meeting_name, presence: true, length: { maximum: 100 }
  validates :meeting_description, length: { maximum: 255 }
  validates :agenda_id, presence: true


  def teste
    @agendas = Agenda.all
  end

  def pega_nome (id_pesq)
    teste
    @agendas.find(id_pesq).agenda_name
  end

end
