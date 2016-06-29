class User < ActiveRecord::Base
    validates :first_name, :last_name, :email, presence: true
    validates :email, uniqueness: true

    has_many :attachments
    accepts_nested_attributes_for :attachments

    has_attached_file :photo_one, :photo_two, :photo_three, :photo_four, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :photo_one, :photo_two, :photo_three, :photo_four, :content_type => /\Aimage\/.*\Z/
end
