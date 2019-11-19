class Connection < ApplicationRecord
  belongs_to :user
  has_many :glances
  has_and_belongs_to_many :checkins
  has_and_belongs_to_many :tags

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, allow_blank: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  mount_uploader :photo, PhotoUploader

  before_save :data_cleanup

  private

  def data_cleanup
    self.email = email.strip if email
  end
end