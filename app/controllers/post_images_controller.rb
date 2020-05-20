class PostImagesController < ApplicationController
  def new
	@post_image = PostImage.new
  end

#投稿データの保存
  def create
	@post_image = PostImage.new(post_image_params)
	@post_image.user_id = current_user.id
	if @post_image.save
		redirect_to post_images_path #PostImageモデルに保存後、投稿一覧画面へ戻る
	else
		render :new
	end
  end

  def index
	@post_images = PostImage.page(params[:page]).reverse_order
	#pageメソッドは、kaminariをインストールしたことで使用可能になったメソッド。1ページ分の決められた数のデータだけを新しい順に取得する。
  end

  def show
  	@post_image = PostImage.find(params[:id])
  	@post_comment = PostComment.new
  end

  def destroy
  	@post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

#post_image_paramsではフォームで入力されたデータが投稿データとして許可されているパラメータかどうかをチェック
  private
	def post_image_params
		params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
