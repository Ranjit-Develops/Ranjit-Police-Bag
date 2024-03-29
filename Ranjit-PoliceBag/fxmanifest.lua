fx_version 'cerulean'
game 'gta5'

author 'ranjit_07'
description 'A Script That Would Allow Police To carry a Their Job Bag'
discord 'https://discord.gg/5aHC4bGtK3'
github 'https://github.com/Ranjit-Develops'
version '1.0.2'

shared_scripts {
    "configs/**.lua"
}

server_script {
    "server/**.lua"
}

client_script {
    "client/**.lua"
}


dependencies {
    'qb-core',
    'qb-target'
}

lua54 'yes'
