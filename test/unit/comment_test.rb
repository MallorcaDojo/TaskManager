require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def test_create_comment_with_task
    testtask = Task.new(
      :deadline => "2012-09-30", 
      :description => "Erstellung der Masken",
      :name => "GUI-Erstellung", 
      :priority => 2
    )
    assert testtask.save, "Fehler bei Task"
    #comment1 = Comment.new(
    #  :text => "Das ist ein Kommentar",
    #  :task => testtask 
    #)
    
    comment1 = Comment.new
    comment1.text = "test"
    comment1.task = testtask
    
    #comment2 = Comment.new(
    #  :text => "Das ist noch ein Kommentar",
    #  :task => testtask 
    #)
    #comment3 = Comment.new(
    #  :text => "Das ist ein weiterer Kommentar",
    #  :task => testtask 
    #)
    assert comment1.save, "Fehler bei comment1"
    #assert comment2.save, "Fehler bei comment2"
    #assert comment3.save, "Fehler bei comment3"
  end
end
