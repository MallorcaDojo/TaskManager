require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def test_create_comment_with_task
    teststatus = Status.new(:name=>"Unassigned",:description=>"Tasks currently not assigend to a user.")
    teststatus.save
    
    testtask = Task.new(
      :deadline => "2012-09-30", 
      :description => "Erstellung der Masken",
      :name => "GUI-Erstellung", 
      :priority => 2
    )
    assert testtask.save, "Fehler bei Task"
    comment1 = Comment.new
    comment1.text = "Das ist ein Kommentar"
    comment1.task = testtask
    
    comment2 = Comment.new
    comment2.text = "Das ist noch ein Kommentar"
    comment2.task = testtask
    
    comment3 = Comment.new
    comment3.text = "123456789"
    comment3.task = testtask
    
    assert comment1.save, "Fehler bei comment1"
    assert comment2.save, "Fehler bei comment2"
    assert !comment3.save, "Sollte comment3 nicht speichern"
  end
end
