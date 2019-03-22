class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :body, presence: true

  after_create_commit { ActionCableBroadcastMessageJob.perform_later(self) }
end
