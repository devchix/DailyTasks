class TaskHistory < ActiveRecord::Base
  belongs_to :task

  def self.find_for_task_this_week(user_id, task_id)
    TaskHistory.find(:all,
      :conditions => [" task_histories.completed_on>:week_ago and tasks.user_id=:user_id and task_id=:task_id",{:week_ago => (Date.today-7),:user_id => user_id,:task_id => task_id}],
      :joins => "inner join tasks on tasks.id=task_histories.task_id")
  end
  
  def self.find_for_week(user_id)
    TaskHistory.find(:all,
      :conditions => [" task_histories.completed_on>:week_ago and tasks.user_id=:user_id",{:week_ago => (Date.today-7),:user_id => user_id}],
      :joins => "inner join tasks on tasks.id=task_histories.task_id")
  end
end
