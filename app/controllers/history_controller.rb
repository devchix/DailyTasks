class HistoryController < ApplicationController
  
  before_filter :login_required
  
  def index
    if params[:id]
      @task = Task.find(params[:id])
    else
      @message = "Placeholder : put cumulative stats here"
    end
  end
   
end
