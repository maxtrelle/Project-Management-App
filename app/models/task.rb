class Task < ApplicationRecord

  belongs_to :project

  validates :name,    presence: true,
                      length: { minimum: 3 }

  validates :status,  inclusion: { in: [ 'not-started', 'in-progress', 'complete' ] }
  
  STATUS_OPTIONS = [
    ['Not started', 'not-started'],
    ['In progress', 'in-progress'],
    ['Complete',    'complete'   ]
  ]

  def task_color
    case status
    when 'not-started' then 'danger'
    when 'in-progress' then 'warning'
    when 'complete'    then 'success'
    end
  end

  def readable_status
    case status
    when 'not-started' then 'Not started'
    when 'in-progress' then 'In progress'
    when 'complete'    then 'Complete'
    end  
  end

  def status_bg_hover
    case status
    when 'not-started' then 'status_bg_hover_not_started'
    when 'in-progress' then 'status_bg_hover_in_progress'
    when 'complete'    then 'status_bg_hover_complete'
    end
  end

  def complete?
    status == 'complete'
  end

  def in_progress?
    status == 'in-progress'
  end

  def not_started?
    status == 'not-started'
  end

end
