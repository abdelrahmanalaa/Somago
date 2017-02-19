class App < ActiveRecord::Base
  has_many :comments
  validates :name , presence: true , length: {maximum: 24 , minimum: 4}
  validates_uniqueness_of :name
end
