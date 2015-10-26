class Rating < ActiveRecord::Base
  enum severity: [ :PG, :PG13, :R ]

  belongs_to :rateable, polymorphic: true
  has_many :topics, source: :rateable, source_type: :Topic
  has_many :posts, source: :rateable, source_type: :Posts
  


  def self.update_rating(rating)
    Rating.find_or_create_by(severity: rating.to_i)
  end
end