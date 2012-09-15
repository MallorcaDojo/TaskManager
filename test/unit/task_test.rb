require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_tasks
    task1 = Task.new(
      :deadline => "2012-09-30", 
      :description => "Erstellung der Masken",
      :name => "GUI-Erstellung", 
      :priority => 2
     )
     
    task2 = Task.new(
      :deadline => "2012-09-29", 
      :description => "Implementierung der Logik im Controller",
      :name => "Controller", 
     )
     
    task3 = Task.new(
      :deadline => "2012-09-28", 
      :description => "Dokumentation von Model, View, Controller",
      :name => "Doku", 
      :priority => 10
     )
     
    task4 = Task.new(
      :deadline => "2012-09-27", 
      :description => "Darstellung der Abhaengigkeiten im Model",
      :name => "Model", 
      :priority => 1
     )
     assert task1.save, "Did not save task1"
     assert task2.save, "Did not save task2"
     assert task3.save, "Did not save task3"
     assert task4.save, "Did not save task4"
  end   
end
