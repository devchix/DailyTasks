class HistoryController < ApplicationController
  
  before_filter :login_required
  
  def index
    if params[:id]
      @task = Task.find(params[:id])
      @completions = TaskHistory.find(:all, 
      :conditions => ["task_id=:task_id and completed_on>:week_ago",{:task_id => params[:id],:week_ago => (Date.today-7)}])
  
    else
      @message = "Placeholder : put cumulative stats here!"
      
      @completions = TaskHistory.find(:all,
         :conditions => [" task_histories.completed_on>:week_ago and tasks.user_id=:user_id",{:week_ago => (Date.today-7),:user_id => 1}],
         :joins => "inner join tasks  on tasks.id=task_histories.task_id")
     
    end
  end
   
end
