    fx_version 'adamant'

    game 'gta5'

    description 'Custom Casino Robbery Script'

    version '1.1.0'
    Author 'Alen_Alex#8055'


client_scripts {
    '@es_extended/locale.lua',
    'cfg.lua',
    'c/a.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'cfg.lua',
	's/a.lua'
}

dependencies {
    'es_extended',
    'utk_fingerprint'
}
