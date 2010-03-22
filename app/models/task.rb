class Task < ActiveRecord::Base
  belongs_to :user
  has_many :task_historys
end
