class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  # validates :name, :post_info {presence: true}
end
