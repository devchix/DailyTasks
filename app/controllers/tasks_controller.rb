class TasksController < ApplicationController

  before_filter :authenticate_user!
  before_filter :find_my_task, :except => [:new, :update]

  def index
    @tasks = Task.incomplete_tasks_for(current_user.id)
    @done = Task.done_tasks_for(current_user.id)
  end

  def show
    if @task.blank?
      flash[:notice] = "You either didn't create task id #{params[:id]} or it doesn't exist"
      redirect_to tasks_path 
    end
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(params[:task])
    @task.user_id = current_user.id    
    respond_to do |format|
      if @task.save
        flash[:notice] = 'Task was successfully created. Add another!'
        format.html { redirect_to(new_task_path) }
        format.xml { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update

    if @task.update_attributes(params[:task])
      flash[:notice] = 'Task was successfully updated.'
    end
    redirect_to @task
  end

  def destroy
    @task.destroy
    redirect_to(tasks_url)
  end

  def complete
    if @task.complete
      flash[:notice] = "Task: #{@task.name} was successfully completed."
    else
      flash[:notice]="Error completing task #{@task.name}."
    end
    redirect_to(tasks_url)
  end

  private
  def find_my_task
    @task = Task.find_by_user_id_and_id(current_user[:id], params[:id])
  end
end
