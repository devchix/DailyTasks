class HistoryController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    if params[:id]
      @task = Task.find(params[:id])
      @completions = TaskHistory.find(:all, 
      :conditions => ["task_id=:task_id and completed_on>:week_ago",{:task_id => params[:id],:week_ago => (Date.today-7)}])
  
    else
      chart = GoogleChart.new
      chart.type = :line_xy
      chart.height = 150
      chart.width = 300
      chart.labels = ['one', 'two','three','four']
      chart.data = [10,5,10,2]
      @graph_url = chart.to_url
      @message = "Placeholder : put cumulative stats here!"
      
      @completions = TaskHistory.find_for_week(current_user.id)
     
    end
  end
   
end
