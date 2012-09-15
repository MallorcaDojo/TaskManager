require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
   test "createProject" do
    project = Project.new
    project.name = "Testproject"
    assert project.save
   end
   
   test "createProjectAndUser" do
     project = Project.new
     project.name = "Testproject with user"
     
     user = User.new
     user.firstname = "Susi"  
     user.lastname = "Sorglos"
     user.birthday = Date.new(1988,8,8)
     assert user.save
     
     project.users = Array.new
     project.users.push user
     
     user.projects = Array.new
     user.projects.push project
     
     assert project.save
   end
end
