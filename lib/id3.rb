$:.unshift File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'extlib'
require 'extlib/dictionary'
require 'thor'
require 'id3lib'

require 'id3/tag_bag/base'
require 'id3/tag_bag/anonymizer'