require 'elasticsearch'
require 'yaml'
require_relative 'utils'

config = YAML.load_file('config.yml')['elastic_config']
client = Elasticsearch::Client.new host: config['host_name'], log: 'true'
# Verifica se existe o index a ser criado
if !client.indices.exists? index: config['index_name']
	client.indices.create index: config['index_name']
end
# Mapeia o index no Elasticsearch
client.indices.put_mapping index: config['index_name'], type: config['type_name'], body: {
	game: {
		properties: {
			name: {type: 'text'},
			steam_id: {type: 'long'},
			description: {type: 'text'},
			developer: {type: 'text'},
			publisher: {type: 'text'},
			price: {type: 'double'},
			categories: {type: 'text', store: true},
			genres: {type: 'text', store: true},
			lauched_data: {type: 'date'},
			languages: {type: 'text', store: true},
			owners: {type: 'long'},
			positive_rating: {type: 'long'},
			negative_rating: {type: 'long'},
			currency_players: {type: 'long'}
		}
	}
}
all_ids = Utils.get_all_ids
puts all_ids