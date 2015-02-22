class Organizer < ActiveRecord::Base
  validates :last_name, :first_name, :email, :tel_1, :tel_2, presence: true
end
