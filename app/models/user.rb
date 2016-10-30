class User < ActiveRecord::Base
	has_secure_password

	has_many :events
	has_and_belongs_to_many :ticket_types

	validates :email, uniqueness: true, presence: true
	validates :password, presence: true
	validates :password_confirmation, presence: true
	validates :name, presence: true

end
