class User < ApplicationRecord
    has_secure_password
    has_many :group_users
    has_many :groups, through: :group_users
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    # validates :password,
    #         length: { minimum: 6 },
    #         if: -> { new_record? || !password.nil? }
end
