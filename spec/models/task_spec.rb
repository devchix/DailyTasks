require File.dirname(__FILE__) + '/../spec_helper'
require 'pp'

describe Task do
  
  before(:each) do
    @task = Task.create(:name => 'get milk', :description => "get skim milk from store")
  end
  
  it "should be be marked complete for today" do
    @task.complete
    @task.task_historys[0].completed_on.should == Date.today
    @task.task_historys.size.should == 1
    @task.last_completed_on.should == Date.today
  end

  it "tomorrow when completed it should have 2 histories" do
    @task.complete
    @task.complete(Date.tomorrow)
    @task.task_historys.size.should == 2
    @task.last_completed_on.should == (Date.tomorrow)
  end
  
end

describe "Tasks for current user" do
  
  before(:each) do
    @user = User.create(:id => 1, :username => 'bob')
    @task1 = Task.create(:name => 'get milk', :description => "get skim milk from store", :user_id => 1)
    @task2 = Task.create(:name => 'get bread', :description => "get sara lee bread from store", :user_id => 1)
  end
  
  it "should have two tasks for today" do
    incomplete = Task.incomplete_tasks_for(@user)
    incomplete.size.should == 2
  end

  it "should have one task left for today" do
    @task1.complete
    incomplete = Task.incomplete_tasks_for(@user)
    incomplete.size.should == 1
  end
  
end

