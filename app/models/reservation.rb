class Reservation < ApplicationRecord
  attr_accessor :token
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :children_number_id
    validates :age_id
  end

  with_options presence: true do
    validates :children_name
    validates :nationality
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "Half-width number"}
    validates :price, format: {with: /\A[0-9]+\z/, message: "Half-width number"}
    validates :user_id
    validates :token
    validates :start_date
    validates :time
  end  
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :children_number
    belongs_to :age
end


