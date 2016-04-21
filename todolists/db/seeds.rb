# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Delete all record
User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

users = [{:name => 'Carly Fiorina', :year => 1954, :gender => 'female',:items => ["a", "b", "c", "d", "e"]}, {:name => 'Donald Trump', :year => 1946, :gender => 'male', :items => ["f", "g", "h", "i", "j"]},
        {:name => 'Ben Carson', :year => 1951, :gender => 'male', :items => ["k", "l", "m", "n", "o"]}, {:name => 'Hillary Clinton', :year => 1947, :gender => 'female', :items => ["p", "q", "r", "s", "t"]}]
due_date = 1.years.from_now
users.each do |user|
   name, last_name = user[:name].split(" ")
   new_user = User.new(:username => last_name, :password_digest => name)
   new_user.create_profile(:gender => user[:gender], :birth_year =>user[:year], :first_name => name, :last_name => last_name)
   #Create teh user list
   user_list = TodoList.new(:list_name => "#{name} list", :list_due_date=> due_date)
   new_user.todo_lists << user_list
   #Create the items
   
   user[:items].each do |item|
      user_list.todo_items << TodoItem.new(:due_date => due_date, :title => item, :description => "description - #{item}", :completed => false)
   end   
   
   #User.create(:username => last_name, :password_digest => name).create_profile(:gender => user[:gender], :birth_year =>user[:year], :first_name => name, :last_name => last_name)
   #create_to_do_list(:list_name => "#{name} list", :list_due_date=> due_date)
   new_user.save
   #query_user = User.find_by last_name: last_name
   #profile = Profile.create(:gender => users[:gender], :birth_year =>users[:year], :first_name => name, :last_name => last_name)
   
end