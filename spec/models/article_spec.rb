require 'spec_helper'

describe Article do
  before(:each) do
    @valid_attrs = {
      :title => "Article #1",
      :body => "Just a test article",
    }
  end
  
  describe "on create method" do
    it "should create valid article using valid params" do
      article = Article.create(@valid_attrs)
      article.should be_valid
      article.new_record?.should be_false
    end

    ["", nil, "123", "A" * 101].each do |attr|
      it "should fail if title is #{attr.inspect}" do
        article = Article.create(@valid_attrs.merge(:title => attr))
        article.should_not be_valid
        article.errors[:title].should_not be_nil
      end
    end
  end

  it {
    Factory.create(:article)
    should validate_uniqueness_of(:title)
  }
  
  it { should validate_presence_of(:body) }
  it { should ensure_length_of(:body).is_at_least(10).is_at_most(5000) }
  it { should have_many(:comments) }
  
end
