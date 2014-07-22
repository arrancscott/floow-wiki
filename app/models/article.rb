class Article < ActiveRecord::Base
	def self.flexible_search(substring)
	  likestr = "%#{substring}%"
	  Article.find_by_sql([
	    "SELECT * FROM articles WHERE title LIKE :str", {str: likestr}])
	end
end
