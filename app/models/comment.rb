class Comment < ActiveRecord::Base
  validates :content , presence: true
  validates :app_id , presence: true
  belongs_to :app
end
