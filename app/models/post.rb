class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  default_scope { order('create_at DESC') }
end
