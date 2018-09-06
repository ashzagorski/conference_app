class Meeting < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :agenda, presence: true
  validates :agenda, length: {minimum: 20}
  validates :agenda, length: {maximum: 100}
  validates :time, presence: true
  validates :time, uniqueness: true
end
