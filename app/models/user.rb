class User < ActiveRecord::Base
    validates :first_name, :last_name, :email, presence: true
    validates :password, presence: true, length: { minimum: 6 }
    validates_confirmation_of :password

    validates :email, uniqueness: true

    has_attached_file :photo_one, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
    }

    has_attached_file :photo_two, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
    }

    has_attached_file :photo_three, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
    }

    has_attached_file :photo_four, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
    }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :photo_one, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo_two, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo_three, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo_four, :content_type => /\Aimage\/.*\Z/
end
