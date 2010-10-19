Factory.define(:comment) do |c|
  c.body "Just a test comment"
  c.association(:article)
end
