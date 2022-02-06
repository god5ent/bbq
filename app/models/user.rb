class User < ApplicationRecord
  has_many :events

  validates :name, presence: true, length: {maximum: 35 }
  validates :email, presence: true, length: {maximum: 99 }
  validates :email, uniqueness: true
  #добавить валидацию почты
end
