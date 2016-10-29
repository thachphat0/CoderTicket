class User < ActiveRecord::Base
	has_secure_password

	validates :email, uniqueness: true, presence: true
	validates :password, presence: true
	validates :password_confirmation, presence: true
	validates :name, presence: true

end
