
module HashtagMethods
  extend ActiveSupport::Concern

  def extract_hashtag(caption)
    if caption.blank?
      return
    end
    return caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) #=> ["#aaa","#bbb"]
  end

  def save_hashtag(hashtag_array,post_instance)
    if hashtag_array.blank?
      return
    end

    hashtag_array.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(name: hashtag.downcase.delete('#'))

      post_hashtag = PostHashtag.new
      post_hashtag.post_id = post_instance.id
      post_hashtag.hashtag_id = tag.id
      post_hashtag.save!
    end
  end

  def creating_structures(posts: "",post_hashtags: "",hashtags: "")
      array = [] #最終戻り値用
      posts.each do |post|
        hashtag = [] #中間テーブルのID情報から探したハッシュタグを格納するための配列
        post_hash = post.attributes
        related_hashtag_records = post_hashtags.select{|ph| ph.post_id == post.id }
        related_hashtag_records.each do |record|
          hashtag << hashtags.detect{ |hashtag| hashtag.id == record.hashtag_id }
        end
      post_hash["hashtags"] = hashtag
      array << post_hash
      end
      return array
  end

  def delete_records_related_to_hashtag(post_id)
    relationship_records = PostHashtag.where(post_id: post_id)
    if relationship_records
      relationship_records.each do |record|
        record.destroy
      end

    end
    all_hashtags = Hashtag.all
    all_related_records = PostHashtag.all
    all_hashtags.each do |hashtag|
      if all_related_records.none?{ |record| hashtag.id == record.hashtag_id }
        hashtag.destroy
      end
    end
  end

end


