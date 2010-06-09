namespace :devchix do
  desc "Load development data"
  task :data, [:task]  => :environment do |t, args|
    args.with_default(:task => 'test task') 
    test_user = User.find_or_create_by_username("testuser")
    task = test_user.tasks.create(:name => args.task)
    task.complete(Date.today)
    task.complete(Date.today - 1.day)
    task.complete(Date.today - 2.day)
    task.complete(Date.today - 3.day)
    puts "added task #{args.task}"
  end
end

