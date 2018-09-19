class MeetingTopic < ApplicationRecord
  belongs_to :meeting
  belongs_to :topic
end
