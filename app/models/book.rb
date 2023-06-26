class Book < ApplicationRecord
  belongs_to :user  # ユーザーに属する

  # バリデーションを設定
  validates :title, presence: true           # titleの存在チェック
  validates :body, presence: true            # bodyの存在チェック
  validates :body, length: { maximum: 200 }  #「200文字以下」

end
