class UsersController < ApplicationController
  def show
    #データ（レコード）を1件取得
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    # アクセスを制限設定（private以降の行に内容を設定）
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])    # ユーザーの取得

    # バリデーション設定
    if @user.update(user_params)         # ユーザーのアップデート
      # ユーザのプロフィール更新が成功したとき:フラッシュメッセージ
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)   # ユーザーの詳細ページへのパス
    else
      render :edit
    end
  end

  def index
    @user= current_user
    @users=User.all
    @book=Book.new
  end

  private

  # 作成データのストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  # 他のユーザーからのアクセスを制限設定
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

end
