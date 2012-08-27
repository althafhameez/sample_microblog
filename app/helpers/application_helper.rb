module ApplicationHelper

	#Returns the full title on each page
	def full_title(page_title)
		base title = "Ruby on Rails Tutorial"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
