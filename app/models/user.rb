class User < ActiveRecord::Base
    validates :first_name, :last_name, :email, presence: true
    validates :email, uniqueness: true

    has_many :attachments
    accepts_nested_attributes_for :attachments
end
