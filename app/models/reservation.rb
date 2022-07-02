class Reservation < ApplicationRecord
  with_options presence: true do
    validates :children_name
    validates :allergy
    validates :nationality
    validates :phone_number
    validates :contact
    validates :user_id
    validates :
  end
end
