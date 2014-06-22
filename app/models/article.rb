class Article < ActiveRecord::Base
	validates :title, presence: true,
										length: { minimum: 5}
	has_many :comments, dependent: :destroy
	belongs_to :user
	
	has_many :article_tags
	has_many :tags, through: :article_tags


	def tags_to_s
  	tags = []
		self.tags.each do |tag|
			tags << tag.label
		end
		tags.join(", ")
  end

  def save_tags(str)
  	self.tags = []
  	tags = str.split(",").map(&:strip).map(&:downcase)
  	tags.each do |tag_text| 
			if Tag.find_by_label(tag_text)
				self.tags << Tag.find_by_label(tag_text)
			else
				self.tags.create(label: tag_text)
			end
		end
	end
end
