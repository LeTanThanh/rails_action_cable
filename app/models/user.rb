class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable, :rememberable,
  devise :database_authenticatable, :registerable, :validatable

  validates :name, presence: true
end
