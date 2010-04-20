class HistoryController < ApplicationController
  
  before_filter :login_required
  
  def index
    if params[:id]
      @task = Task.find(params[:id])
      @count = TaskHistory.count(:conditions => "task_id='#{params[:id]}' AND completed_on >'#{Date.today-7}'")
    else
      @message = "Placeholder : put cumulative stats here!"
    end
  end
   
end
