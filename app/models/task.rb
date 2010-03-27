class Task < ActiveRecord::Base
  belongs_to :user
  has_many :task_historys
  
  #named_scope :todo, lambda {{:conditions =>["last_completed_on < ?",Date.today]}}  
  
  # if no date passed in, default is today (needed for testing)
  def complete(complete_date = Date.today)
    # create history record attached to this task
    self.task_historys.create(:completed_on => complete_date)
    # set the last completed date on the task, makes it easier to list tasks not done today
    self.update_attribute('last_completed_on', complete_date)
  end
  
  def self.incomplete_tasks_for(user)
    tasks_to_do = []
    Task.find_all_by_user_id(user.id).each do |task|
      if task.last_completed_on.nil? or (task.last_completed_on.to_time.to_i != Date.today.to_time.to_i)
        tasks_to_do.push task   # could also do:  tasks_to_do << task
      end
    end
    tasks_to_do
  end
  
  
end
