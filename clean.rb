#!/usr/bin/env ruby
require 'fileutils'
home = Dir.home

dirs = [
  "#{home}/Library/Caches/com.apple.helpd",
  "#{home}/Library/Caches/PhpStorm2017.1",
  "#{home}/Library/Caches/PhpStorm2017.2",
  "#{home}/Library/Caches/PhpStorm2017.3",
  "#{home}/Library/Caches/WebStorm2017.1",
  "#{home}/Library/Caches/WebStorm2017.2",
  "#{home}/Library/Caches/WebStorm2017.3",
  "#{home}/Library/Caches/Homebrew",
  "#{home}/Library/Caches/Waterfox",
  "#{home}/Library/Caches/com.getdropbox.DropboxMetaInstaller",
  "#{home}/Library/Caches/VisualStudio",
  "#{home}/Library/Logs/Electron",
  "#{home}/Library/Logs/PhpStorm2017.1",
  "#{home}/Library/Logs/PhpStorm2017.2",
  "#{home}/Library/Logs/PhpStorm2017.3",
  "#{home}/Library/Logs/VisualStudio",
  "#{home}/Library/Logs/WebStorm2017.1",
  "#{home}/Library/Logs/WebStorm2017.2",
  "#{home}/Library/Logs/WebStorm2017.3",
]

def remove_folder(path)
  p = Dir.glob(path)
  puts "Removing #{p}"
  FileUtils.rm_rf(p)
end

dirs.each { |d|
   remove_folder(d) if Dir.exists?(d)
}
