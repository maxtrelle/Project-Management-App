class Task < ApplicationRecord

  belongs_to :project

  validates :name,        presence: true
  validates :description, presence: true, length: { :minimum => 3 }
  validates :status,      inclusion: { in: ['not-started', 'in-progress', 'complete'] }
  
  STATUS_OPTIONS = [
    ['Not started', 'not-started'],
    ['In progress', 'in-progress'],
    ['Complete',    'complete'   ]
  ]

end
