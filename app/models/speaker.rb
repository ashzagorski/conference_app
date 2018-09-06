class Speaker < ApplicationRecord
  validates :first_name, presence: true
  validates :first_name, length: {minimum: 2}
  validates :last_name, presence: true
  validates :last_name, length: {minimum: 2}
  validates :email, uniqueness: true
  validates :age, numericality: {greater_than: 18}
end 
