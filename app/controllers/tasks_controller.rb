class TasksController < ApplicationController
  def index
    @tasks = Task.all
    
     respond_to do |format|
        format.html # list.html.erb
        format.xml  { render :xml => @tasks }
      end
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
      redirect_to(@task) 
    end
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update_attributes(params[:task])
        flash[:notice] = 'Task was successfully updated.'
     end
     redirect_to @task
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    redirect_to(tasks_url)

  end

end
