class Collection < ApplicationRecord
  has_many :articles, dependent: :destroy
  validates :title,
            presence: true,
            length: { minimum: 3, :maximum => 100 }
end
