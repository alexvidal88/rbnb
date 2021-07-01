class Sock < ApplicationRecord
  has_one_attached :photo
  has_many :bookings
  belongs_to :user
  validates :name, :price, :description, :photo, presence: true
  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
