class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_ancestry
end