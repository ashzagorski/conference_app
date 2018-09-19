class Meeting < ApplicationRecord
  belongs_to :speaker
  has_many :meeting_topics
  has_many :topics, through: :meeting_topics
  
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :agenda, presence: true
  validates :agenda, length: {minimum: 20}
  validates :agenda, length: {maximum: 100}
  validates :time, presence: true


  def topic_names
    @meeting.topics.pluck(:name)
  end
end
