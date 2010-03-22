class TasksController < ApplicationController
  
  before_filter :login_required
   
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end
  
  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      flash[:notice] = 'Task was successfully created.'
      redirect_to @task
    end
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update_attributes(params[:task])
        flash[:notice] = 'Task was successfully updated.'
     end
     redirect_to @task
  end


  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to(tasks_url)
  end
  
  def complete
    @task = Task.find(params[:id])
    @task
    redirect_to(tasks_url)
  end
  

end
