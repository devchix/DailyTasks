class HistoryController < ApplicationController
  
  def index
    @task = Task.find(params[:id])
    
   end
   
end
