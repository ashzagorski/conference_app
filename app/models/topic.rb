class Topic < ApplicationRecord
  has_many :meeting_topics
  has_many :meetings, through: :meeting_topics
end
