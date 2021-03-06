class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects

  validates :email,  presence: true, 
                     uniqueness: true, 
                     format: { with: Devise.email_regexp }

end
