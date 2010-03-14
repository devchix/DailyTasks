class TasksController < ApplicationController
  def index
    @tasks = Task.all
    
     respond_to do |format|
        format.html # list.html.erb
        format.xml  { render :xml => @tasks }
      end
      
  end



  def edit
  end

  def details
  end
  
 
   def add
      @task = Task.new(params[:task])
      respond_to do |format|
        if @task.save
          flash[:notice] = 'Task was successfully created.'
          format.html 
          format.xml  { render :xml => @task}
        else
          format.html 
          format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
        end
      end
    end
 

end
