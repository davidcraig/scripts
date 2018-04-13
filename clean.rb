#!/usr/bin/env ruby
require 'fileutils'
home = Dir.home

dirs = [
  "#{home}/Library/Caches/com.apple.helpd",
  "#{home}/Library/Caches/Homebrew",
  "#{home}/Library/Caches/Waterfox",
  "#{home}/Library/Caches/com.getdropbox.DropboxMetaInstaller",
  "#{home}/Library/Caches/VisualStudio",
  "#{home}/Library/Logs/Electron",
  "#{home}/Library/Logs/VisualStudio",
]

def remove_folder(path)
  if Dir.exists?(path)
    p = Dir.glob(path)
    puts "Removing #{p}"
    FileUtils.rm_rf(p)
  end
end

# Main List
dirs.each { |d|
  remove_folder(d)
}

jetbrains = [
  'PhpStorm',
  'WebStorm'
]

jetbrains_old_versions = [
  '2017.1',
  '2017.2',
  '2017.3',
]

jetbrains.each { |j|
  jetbrains_old_versions.each { |v|
    logs = "#{home}/Library/Logs/#{j}#{v}"
    cache = "#{home}/Library/Cache/#{j}#{v}"
    remove_folder(logs)
    remove_folder(cache)
  }
}
