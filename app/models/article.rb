class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :revisions, dependent: :destroy
  belongs_to :collection
  validates :title,
            presence: true,
            length: { minimum: 3, :maximum => 50 }
  validates :summary,
            presence: true,
            length: { minimum: 3, :maximum => 100 }
end
