# articles_factory.rb
Factory.define(:article) do |a|
  a.sequence(:title) { |n| "Title ##{n}" }
  a.body Faker::Lorem.paragraph
end
