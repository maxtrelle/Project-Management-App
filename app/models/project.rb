class Project < ApplicationRecord

  has_many :tasks, dependent: :destroy
  belongs_to :user

  validates :name,  presence: true, uniqueness: true,
                    length: { minimum: 3 }

  def task_color
    case status
    when 'not-started'  then 'danger'
    when 'in-progress'  then 'warning'
    when 'complete'     then 'success'
    end
  end

  def status
    return 'not-started' if tasks.none?

    if tasks.all? { |task| task.complete? }
      'complete'
    elsif tasks.any? { |task| task.in_progress? || task.complete? }
      'in-progress'
    else
      'not-started'
    end
  end

  def percent_complete
    return 0 if tasks.none?

    ((total_complete.to_f / total_tasks) * 100).round
  end

  def total_complete
    tasks.select { |task| task.complete? }.count
  end

  def total_tasks
    tasks.count
  end

end
