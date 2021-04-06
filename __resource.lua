client_script "client.lua"
server_script {
    '@mysql-async/lib/MySQL.lua',
    "server.lua",
}
shared_script{
    '@es_extended/locale.lua',
    'config.lua',
    'locales/en.lua',
    'locales/zh.lua'
}
