class Reservation < ApplicationRecord
  attr_accessor :token
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :children_number_id
    validates :age_id
  end

  with_options presence: true do
    validates :children_name
    validates :nationality
    validates :phone_number
    validates :price
    validates :user_id
    validates :token
  end  
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :children_number
    belongs_to :age
end


