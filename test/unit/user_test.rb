require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "createUser" do
     user = User.new
    user.firstname = "Markus"  
    user.lastname = "Koscheierle"
    user.birthday = Date.new(1980,6,8)  
    assert user.save
   end
   
   test "createUserAndTask" do
     
    user = User.new
    user.firstname = "Markus"  
    user.lastname = "Koscheierle"
    user.birthday = Date.new(1980,6,8)
    
    task = Task.new
    user.tasks = Array.new
    user.tasks.push task
    task.name = "MyTask"
    task.priority = 1
    task.description = "MyDesc"
    task.deadline = Date.new(2013,6,8)
    
      
    assert user.save
   end
   
   test "createUserAndProject" do
    user = User.new
    user.firstname = "Markus"  
    user.lastname = "Koscheierle"
    user.birthday = Date.new(1980,6,8)
    
    project = Project.new
    project.name = "MyTestProject"
    
    user.projects = Array.new
    user.projects.push project
    
    assert user.save
   end
end
