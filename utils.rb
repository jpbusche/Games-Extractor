require 'httparty'

module Utils

	def self.get_all_ids
		all_ids = []
		url = 'http://steamspy.com/api.php?request=all'
		response = HTTParty.get(url)
		response.parsed_response
		response.each do |app|
			app_info = {}
			app_info["name"] = app[1]["name"]
			app_info["steam_id"] = app[1]["appid"]
			all_ids.push(app_info)
		end
		return all_ids
	end
end