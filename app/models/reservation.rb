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
  end  
  belongs_to :user

  validate :date_before_start
  validate :date_current_today
  validate :date_three_month_end
  
  def date_before_start
    errors.add(:day, "は過去の日付は選択できません。予約画面から正しい日付を選択してください。") if day < Date.current
  end

  def date_current_today
    errors.add(:day, "は当日は選択できません。予約画面から正しい日付を選択してください。") if day < (Date.current + 1)
  end

  def date_three_month_end
    errors.add(:day, "は3ヶ月以降の日付は選択できません。予約画面から正しい日付を選択してください。") if (Date.current >> 3) < day
  end

  def self.check_reservation_day(day)
    if day < Date.current
      return "過去の日付は選択できません。正しい日付を選択してください。"
    elsif day < (Date.current + 1)
      return "当日は選択できません。正しい日付を選択してください。"
    elsif (Date.current >> 3) < day
      return "3ヶ月以降の日付は選択できません。正しい日付を選択してください。"
    end
  end

  def self.reservations_after_three_month
    reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    reservation_data = []
    reservations.each do |reservation|
      reservations_hash = {}
      reservations_hash.merge!(day: reservation.day.strftime("%Y-%m-%d"), time: reservation.time)
      reservation_data.push(reservations_hash)
    end
    reservation_data
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :children_number
    belongs_to :age
end


