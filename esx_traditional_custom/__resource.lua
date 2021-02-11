resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'esx_traditional_custom'

version '1.0.1'

server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	"server.lua",
	"language.lua"
}

client_scripts {
	'@es_extended/locale.lua',
	"client.lua",
	"language.lua"
}

dependency 'es_extended'


