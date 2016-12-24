require 'bcrypt'
class User < ActiveRecord::Base
    # users.password_hash in the database is a :string
    include BCrypt

    validates :first_name, :last_name, :email, presence: true
    validates :password, presence: true, length: { minimum: 6 }
    validates_confirmation_of :password

    validates :email, uniqueness: true
    validates :username, uniqueness: true

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
    validates_attachment_content_type :resume,  :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)

  def downcase_fields
      self.email.downcase!
      self.username.downcase!
   end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, login_password)
      user = User.find_by(email: email)

      if user.password == login_password
        return user
      else
        return false
      end

      def self.match_password(login_password)
        encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
      end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
