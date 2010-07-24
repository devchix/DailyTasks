# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)



#WhitelistEntry.create(:email=>'fakeemail1@gmail.com')
#WhitelistEntry.create(:email=>'fakeemail2@gmail.com')
File.open("addresses.txt", "r") do |infile|
  while (line = infile.gets)
       if(line)
       #puts "#{line}"
       WhitelistEntry.create(:email=>line)
     end
    end
end
