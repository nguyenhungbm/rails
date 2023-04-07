class Comment < ApplicationRecord
  belongs_to :micropost
  default_scope -> { order(created_at: :desc) }
  has_closure_tree
end
