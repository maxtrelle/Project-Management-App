import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for TasksReflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {

  sort(event) {
    let element       = document.getElementByID('tasks-list')
    let task_elements = document.getElementByID('task-item')
    let tasks         = Array.from(task_elements).map((task, index) => {
      return { id: task.dataset.taskId, position: (index + 1) }
    })

    element.dataset.tasks = tasks
    this.stimulate('TasksReflex#sort', element)

  }

}
