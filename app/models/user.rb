class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #deviceで利用する機能が記述されている
  has_many :post_images, dependent: :destroy
   #Userモデルに対してPostImageモデルが1:Nになるよう関連付ける。hasmanyの後は1:Nの関係になるモデル名を複数形で記述
  has_many :post_comments, dependent: :destroy
  #dependent: :destroyは、has_manyで使えるオプション。
  #1:Nの関係において、「1」のデータが削除された場合、関連する「N」のデータも削除される設定
  #この設定では、Userのデータが削除されたとき、そのUserが投稿したコメントデータも一緒に削除される
  has_many :favorites, dependent: :destroy
  #Favoriteモデルのカラム（user_idとpost_image_id）は、UserモデルのidやPostImageモデルのidと関連付けが必要
  attachment :profile_image
  #attachmentには、カラム名（profile_image_id）から_idを除いた名前（profile_image）を記述します（2章参照）。
end
