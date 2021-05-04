class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.integer :user_id
      t.string :title #投稿のタイトルを入力
      t.string :caption #投稿の内容を入力。ここにハッシュタグが入力される前提。
      t.string :image_id #画像投稿用

      t.timestamps
    end
  end
end
