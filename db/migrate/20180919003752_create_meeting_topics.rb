class CreateMeetingTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :meeting_topics do |t|
      t.integer :topic_id
      t.integer :meeting_id

      t.timestamps
    end
  end
end
