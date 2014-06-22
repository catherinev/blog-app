class Tag < ActiveRecord::Base
	validates :label, presence: true

  has_many :article_tags
	has_many :articles, through: :article_tags
	has_many :users, through: :articles
end
