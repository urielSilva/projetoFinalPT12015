class Meeting < ActiveRecord::Base

  has_one :agenda

  def teste
    @agendas = Agenda.all
  end

  def pega_nome (id_pesq)
    teste
    @agendas.find(id_pesq).agenda_name
  end

end
