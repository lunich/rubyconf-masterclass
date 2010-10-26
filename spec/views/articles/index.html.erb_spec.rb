require 'spec_helper'

describe "articles/index.html.erb" do
  before(:each) do
    @articles = [
      Factory.stub(:article),
      Factory.stub(:article, :body => "<script>"),
    ]
    @articles.stub!(:total_pages => 2)
    @articles.stub!(:current_page => 2)
    assigns[:articles] = @articles
    render
  end
  
  it "should render valid html" do
    rendered.should have_selector("h1") do |h1|
      h1.inner_html.should == "Articles"
    end
    rendered.should have_selector("div#articles") do |articles_div|
      @articles.each do |a|
        articles_div.should have_selector("div.article#article-#{a.id}") do |article_div|
            article_div.should have_selector("h2") do |h2|
              h2.inner_html.should == h(a.title)
            end
            article_div.should have_selector("p") do |p|
              p.inner_html.should == h(a.body)
            end
        end
      end
    end
  end
end
