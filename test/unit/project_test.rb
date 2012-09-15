require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
   test "createProject" do
    project = Project.new
    project.name = "TestProjekt"
    assert project.save
   end
end
