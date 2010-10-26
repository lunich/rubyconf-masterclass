class Article < ActiveRecord::Base
  validates :title,
    :presence => true,
    :length => 4..100,
    :uniqueness => true
    
  validates :body,
    :presence => true,
    :length => 10..5000
    
  has_many :comments
  
  cattr_reader :per_page
  @@per_page = 2
end
