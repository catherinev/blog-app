class Tag < ActiveRecord::Base
	validates :label, presence: true

  has_many :article_tags
	has_many :articles, through: :article_tags
	has_many :users, through: :articles


	def self.articles_with_user_and_tag(user_id, tag_id)
		all_articles = Article.where('user_id =?', user_id).order("created_at DESC")
		found_articles = []
		all_articles.each do |article|
			if article.tags.find_by_id(tag_id)
				found_articles << article
			end
		end
		found_articles
	end

end
