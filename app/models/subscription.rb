class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  before_validation :email_downcase

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, unless: -> { user.present? }

  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }

  validate :email_registered, unless: -> { user.present? }

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  private

  def email_downcase
    user_email&.downcase!
  end

  def email_registered
    if User.where(email: user_email).present?
      errors.add(:user_email, :already_exists)
    end
  end
end
