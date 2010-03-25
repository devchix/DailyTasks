class Task < ActiveRecord::Base
  belongs_to :user
  has_many :task_historys
  
  # if no date passed in, use today
  def complete(date = Date.today)
    self.task_historys.create(:completed_on => date)
  end
end
