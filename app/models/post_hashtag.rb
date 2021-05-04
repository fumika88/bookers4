class PostHashtag < ApplicationRecord

  validates :post_id, presence: true
  validates :hashtag_id, presence: true

end
