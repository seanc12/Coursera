user_list = 
[             
 ["Carly", "Fiorina", "female", 1954], 
 ["Donald", "Trump", "male", 1946], 
 ["Ben", "Carson", "male", 1951],           
 ["Hillary", "Clinton", "female", 1947]     
]
#Profile.destroy_all
User.destroy_all
#TodoList.destroy_all

User.create! [
{username: "Fiorina" , password_digest: "123"},
{username: "Trump" , password_digest: "1234"},
{username: "Carson" , password_digest: "12345"},
{username: "Clinton" , password_digest: "123456"}
]

user_list.each do |fname, lname, gender, dob|	
  User.find_by!(username: lname).create_profile(gender: gender, 
  				birth_year: dob, first_name: fname, last_name: lname)
end

duedate = Date.today + 1.year
lnames = ["Fiorina", "Trump", "Carson", "Clinton"]
lnames.each do |lname| 
	user = User.find_by!(username: lname)
	todo = TodoList.create!(list_name: "stuff", list_due_date: duedate)
	user.todo_lists << todo

	item = TodoItem.create!([{title: "Wow", description: "Not as wow as first imagined", due_date: duedate},
							 {title: "Wow", description: "Not as wow as first imagined", due_date: duedate},
							 {title: "Wow", description: "Not as wow as first imagined", due_date: duedate},
							 {title: "Wow", description: "Not as wow as first imagined", due_date: duedate},
							 {title: "Wow", description: "Not as wow as first imagined", due_date: duedate},])
	todo.todo_items << item 
	
end