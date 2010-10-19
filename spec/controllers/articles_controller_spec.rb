require 'spec_helper'

describe ArticlesController do

  describe "routes" do
    it "should be valid for /" do
      { :get => "/" }.should route_to(:controller => "articles",
        :action => "index")
    end
    it "should be valid for /articles" do
      { :get => "/articles" }.should route_to(:controller => "articles",
        :action => "index")
    end
    it "should be valid for /articles/12" do
      { :get => "/articles/12" }.should route_to(:controller => "articles",
        :action => "show", :id => "12")
    end
  end
  
  describe "GET 'index'" do
    before(:each) do
      @articles = [
        Factory.stub(:article),
        Factory.stub(:article),
      ]
      Article.stub!(:all).and_return(@articles)
      Article.should_receive(:all).with().and_return(@articles)
      get 'index'
    end
    it "should be successful" do
      response.should be_success
    end
    it { should render_template("index") }
    it "should assign :articles" do
      assigns[:articles].should eq(@articles)
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show', :id => 12
      response.should be_success
    end
  end

end
