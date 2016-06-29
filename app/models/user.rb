class User < ActiveRecord::Base
    validates :first_name, :last_name, :email, presence: true
    validates :password, presence: true, length: { minimum: 6 }
    validates_confirmation_of :password

    validates :email, uniqueness: true

    has_attached_file :photo_one
    has_attached_file :photo_two
    has_attached_file :photo_three
    has_attached_file :photo_four
    has_attached_file :resume

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :photo_one, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo_two, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo_three, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo_four, :content_type => /\Aimage\/.*\Z/
  validates_attachment :resume, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end
