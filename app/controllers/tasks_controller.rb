class TasksController < ApplicationController
  def index
    @tasks = Task.all
    
     respond_to do |format|
        format.html # list.html.erb
        format.xml  { render :xml => @tasks }
      end
      
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      flash[:notice] = 'Task was successfully created.'
      redirect_to tasks_url
    else
     #error saving
    end
  end

  def edit
  end

end
