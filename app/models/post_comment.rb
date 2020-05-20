class PostComment < ApplicationRecord
	belongs_to :user
	belongs_to :post_image
	#UserモデルとPostCommentモデルに記述。
	#UserモデルもPostImageモデルも関連付けられるのは1つのため、belongs_toを記述する
end
