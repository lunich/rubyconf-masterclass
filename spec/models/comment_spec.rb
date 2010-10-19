require 'spec_helper'

describe Comment do
  it { should validate_presence_of(:body) }
  it { should ensure_length_of(:body).is_at_least(10).is_at_most(1000) }
  
  it { should belong_to(:article) }
  it { should validate_presence_of(:article) }

  describe "create method" do
    before(:each) do
      @article = Factory.create(:article)
    end
    it "should increase article's comments count" do
      lambda do
        Comment.create(Factory.attributes_for(:comment,
          :article_id => @article.id))
      end.should change(@article.comments, :count).by(1)
    end
  end
end
