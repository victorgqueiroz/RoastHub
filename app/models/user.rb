class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :coffees, through: :sales
  has_many :sales
  validates :email, presence: true, uniqueness: true
  #  validates :encrypted_password, presence: true
  validates :name, presence: true
end
