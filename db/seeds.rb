# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

first_user = User.create(:username => "testuser")
first_user.tasks.build(:name => "walk 1 mile")
first_user.tasks.build(:name => "wash dishes")
first_user.tasks.build(:name => "make bed")