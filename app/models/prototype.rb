class Prototype < ApplicationRecord


  validates :title,      presence: true
  validates :catch_copy, presence: true
  validates :concept,    presence: true
  validates :image,      presence: true

  has_many :comment, dependent: :destroy
  belongs_to :user
  has_one_attached :image

end
