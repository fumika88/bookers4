class Post < ApplicationRecord

  validates :title, presence: true
  validates :caption, presence: true

  attachment :image #gem refileを使用しているため記入。ハッシュタグ実装には関係ない。
end
