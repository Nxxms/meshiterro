class PostCommentsController < ApplicationController

  def create
  	post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    #上記、以下の省略。
    #comment = PostComment.new(post_comment_params)
    #comment.user_id = current_user.id
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
　end

  private
	def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
 
  #今回、indexアクションやnewアクションは作成しない。
  #コメント投稿だけの一覧画面や投稿画面は作成せず、その代わり投稿画像の詳細画面（/post_image/:id/）にコメント投稿機能を実装します
end
