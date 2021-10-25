class TasksController < ApplicationController
    def index
      end
 def show
  end
  def new
     @task = Task.new
   end
  def edit
  end
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
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "The task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "The task was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
  def set_task
    @task = current_user.tasks.find(params[:id])
  end

	def task_params
		params.require(:task).permit(:name, :description, :status, :priority, :deadline, label_ids: [])
	end
  end
