class Article < ActiveRecord::Base
  validates :title,
    :presence => true,
    :length => 4..100,
    :uniqueness => true
    
  validates :body,
    :presence => true,
    :length => 10..5000
    
  has_many :comments
end
