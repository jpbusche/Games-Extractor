require 'httparty'

module Utils

	def self.get_all_ids
		url = 'https://api.steampowered.com/ISteamApps/GetAppList/v2/'
		response = HTTParty.get(url)
		response.parsed_response
		data = response['applist']['apps']
		return data
	end
end