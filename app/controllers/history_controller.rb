class HistoryController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    if params[:id]
      @task = Task.find(params[:id])
      @completions = TaskHistory.find(:all, 
      :conditions => ["task_id=:task_id and completed_on>:week_ago",{:task_id => params[:id],:week_ago => (Date.today-7)}])
  
    else
      
      @completions = TaskHistory.find_for_week(current_user.id)
     
    end
  end
   
end
