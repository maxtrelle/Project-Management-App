# frozen_string_literal: true

class StatusReflex < ApplicationReflex

  include ApplicationHelper

  def change
    task = Task.find(element.dataset[:id])
    task.update(status: element.dataset[:status])
  end

end
