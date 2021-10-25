class ApplicationController < ActionController::Base
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
 if params[:back]
  render :new
  else
    if @task.save
    redirect_to tasks_path, notice: "The task was successfully created"
      else
         render :new
    end
  end
end
