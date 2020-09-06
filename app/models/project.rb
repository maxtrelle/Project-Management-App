class Project < ApplicationRecord

  has_many :tasks, dependent: :destroy
  belongs_to :user

  validates :name,        presence: true, uniqueness: true
  validates :description, presence: true, length: { :minimum => 3 }

end
