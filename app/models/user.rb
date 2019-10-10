class User < ApplicationRecord

	has_many :selections
	has_many :posts
	has_many :comments
	has_many :probes
	has_many :tags
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
