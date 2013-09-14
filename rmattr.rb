require 'rubygems'
require 'find'
require 'ffi-xattr'

if !ARGV[0]
  puts 'Usage: root dir';
  exit
end

Find.find ARGV[0] do |file|
  xattr = Xattr.new file
  xattr.list.each do |attr|
    xattr.remove attr
  end
  `chmod -N \"#{File.expand_path file}\"`
end
