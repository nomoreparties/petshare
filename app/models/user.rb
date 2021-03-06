class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :confirmable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pets
end
