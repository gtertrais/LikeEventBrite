class Event < ApplicationRecord

  belongs_to :user
  has_many :attendances
  has_many :users, through: :attendances

  validates :start_date, :duration, :title, :description, :price, :location, presence: true

  validate :start_date_cannot_be_in_the_past
  validates :duration, numericality: { greater_than: 0 }
  validates :title, length: { in: 5..140 }
  validates :description, length: { in: 20..1000 }
  validates :price, :inclusion => 1..1000



def start_date_cannot_be_in_the_past
  errors.add(:start_date, "can't be in the past") if
    !start_date.blank? and start_date < Date.today
end





end
