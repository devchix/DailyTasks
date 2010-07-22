class TaskHistory < ActiveRecord::Base
  belongs_to :task

  def self.find_completed_for_week
TaskHistory.find_by_sql("select count(*) total, completed_on from task_histories group by completed_on").collect{ |t| t.total.to_i}
  end
  
  def self.find_for_week(user_id)
    TaskHistory.find(:all,
      :conditions => [" task_histories.completed_on>:week_ago and tasks.user_id=:user_id",{:week_ago => (Date.today-7),:user_id => user_id}],
      :joins => "inner join tasks on tasks.id=task_histories.task_id")
  end
end
