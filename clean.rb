#!/usr/bin/env ruby
require 'fileutils'

def remove_folder(path)
  if Dir.exists?(path)
    p = Dir.glob(path)
    puts "Removing #{p}"
    FileUtils.rm_rf(p)
  else
    puts "Folder #{path} does not exist"
  end
end

def remove_app_junk(app)
  logs = "#{Dir.home}/Library/Logs/#{app}"
  cache = "#{Dir.home}/Library/Cache/#{app}"
  remove_folder logs
  remove_folder cache
end

# ##### #
# Other #
# ##### #

dirs = [
  "#{Dir.home}/Library/Caches/com.apple.helpd",
  "#{Dir.home}/Library/Caches/com.getdropbox.DropboxMetaInstaller",
]

dirs.each { |d|
  remove_folder d
}

# ############ #
# Applications #
# ############ #

apps = [
  'Electron',
  'Homebrew',
  'VisualStudio',
]

apps.each { |app|
  remove_app_junk app
}

# ################################# #
# Remove old JetBrains product data #
# ################################# #

jetbrains = [
  'PhpStorm',
  'WebStorm',
]

jetbrains_old_versions = [
  '2017.1',
  '2017.2',
  '2017.3',
  '2018.1',
  '2018.2',
]

jetbrains.each { |j|
  jetbrains_old_versions.each { |v|
    remove_app_junk("#{j}#{v}")
  }
}
