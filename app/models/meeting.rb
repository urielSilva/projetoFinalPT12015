class Meeting < ActiveRecord::Base

  validates :meeting_name, presence: true, length: { maximum: 100 }
  validates :meeting_description, length: { maximum: 255 }
  validates :agenda_id, presence: true


  has_one :agenda

  def teste
    @agendas = Agenda.all
  end

  def pega_nome (id_pesq)
    teste
    @agendas.find(id_pesq).agenda_name
  end

end
