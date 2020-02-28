class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :articles, through: :taggings# allows us to use tag.articles
end
