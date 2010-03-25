require File.dirname(__FILE__) + '/../spec_helper'

describe Task do
  
  before(:each) do
    @task = Task.create(:name => 'get milk', :description => "get skim milk from store")
  end
  
  it "should be be marked complete for today" do
    @task.complete
    @task.task_historys[0].completed_on.should == Date.today
    @task.task_historys.size.should == 1
  end

  it "tomorrow when completed it should have 2 histories" do
    @task.complete
    @task.complete(Date.today + 1.day)
    @task.task_historys.size.should == 2
  end
  
end
