class PostImage < ApplicationRecord
	belongs_to :user
 #belongs_toは、PostImageモデルからuser_idに関連付けられていて、Userモデルを参照することができる
 	attachment :image #ここを追加（_idは含めない）
 	has_many :post_comments, dependent: :destroy
 	#PostImageモデルに、PostCommentモデルとの関連付けを追加
 	#PostImageモデルに関連付けられるUserモデルは、1つです
 	has_many :favorites, dependent: :destroy

 	validates :shop_name, presence: true
    validates :image, presence: true

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
        #引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる。存在:true/存在してない:false
    end
end
