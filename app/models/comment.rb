class Comment < ActiveRecord::Base
  validates :body,
    :presence => true,
    :length => 10..1000
  
  validates :article,
    :presence => true
    
  belongs_to :article
end
