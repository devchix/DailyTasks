class TaskHistory < ActiveRecord::Base
  belongs_to :task

  def self.find_completed_for_week(user_id, today = Date.today)
    #gets the days between the week
    start_of_week = today - (today.cwday) - 1  
    end_of_week = start_of_week + 7.days 
TaskHistory.find_by_sql("select count(*) as total, completed_on from task_histories LEFT JOIN tasks ON task_histories.task_id=tasks.id WHERE tasks.user_id=#{user_id} and task_histories.completed_on BETWEEN '#{start_of_week}' and '#{end_of_week}' group by completed_on ").collect{ |t| t.total.to_i}
  end
  
  def self.find_for_week(user_id)
    TaskHistory.find(:all,
      :conditions => [" task_histories.completed_on>:week_ago and tasks.user_id=:user_id",{:week_ago => (Date.today-7),:user_id => user_id}],
      :joins => "inner join tasks on tasks.id=task_histories.task_id")
  end
  
end
