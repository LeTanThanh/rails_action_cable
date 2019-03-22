class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroe

  validates :title, presence: true, uniqueness: true
end
