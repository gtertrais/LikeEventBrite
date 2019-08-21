class Event < ApplicationRecord

  belongs_to :user
  has_many :attendances
  has_many :users, through: :attendances
  has_many_attached :photos

  validates :start_date, :duration, :title, :description, :price, :location, presence: true

  validates :start_date_cannot_be_in_the_past, presence: true
  validates :duration, numericality: { greater_than: 0 }
  validates :title, length: { in: 5..140 }
  validates :description, length: { in: 20..1000 }
  validates :price, :inclusion => 0..1000
    
  



  def start_date_cannot_be_in_the_past
    if start_date == nil
    errors.add(:start_date, "enter date") 
    elsif start_date < Time.now
      errors.add(:start_date, "can't be in the past") 
  end
end


  def is_payable?
    return self.price > 0
  end


end
