namespace :devchix do
  desc "Creates a task done today and previous 3 days: TASK='task name'"
  task :data, [:task]  => :environment do |t, args|
    args.with_default(:task => 'test task') 
    test_user = User.first
    task = test_user.tasks.create(:name => args.task)
    task.complete(Date.today - 3.day)
    task.complete(Date.today - 2.day)
    task.complete(Date.today - 1.day)
    task.complete() #default does today
  
    puts "added task #{args.task}"
  end
end

