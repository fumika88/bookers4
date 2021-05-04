class CreateHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags do |t|

      t.string :name #ハッシュタグが保存されるカラム

      t.timestamps
    end
  end
end
