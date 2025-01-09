class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  #dependent: :destroy意思是如果我删了一家餐厅那么它的评论会一起被删除

  validates :name, :address, :category, presence: true
  # :name、:address、:category 必须有值，不能是空的。
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }
end
