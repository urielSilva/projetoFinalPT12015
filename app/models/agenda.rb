class Agenda < ActiveRecord::Base

  validates :agenda_name, presence: true, length: { maximum: 100 }

  belongs_to :meeting

end
