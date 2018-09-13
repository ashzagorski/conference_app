class Meeting < ApplicationRecord
  belongs_to :speaker
  
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :agenda, presence: true
  validates :agenda, length: {minimum: 20}
  validates :agenda, length: {maximum: 100}
  validates :time, presence: true
  


end
