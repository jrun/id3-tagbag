require 'rubygems'
require 'rstack'
require File.join(File.dirname(__FILE__), 'lib', 'id3', 'tag_bag', 'version')

RStack::Configuration.new 'id3-tagbag' do |config|
  config.summary  = 'Removes the comments from MP3 ID3 tags'
  config.author   = 'jrun'
  config.email    = 'jeremy.burks@gmail.com'
  config.version  = ID3::TagBag::Version::STRING

  config.dependencies['extlib'] = '>= 0.9.8'
  config.dependencies['thor'] = '>= 0.9.9'
  config.dependencies['id3lib-ruby'] = '= 0.5.0'

  config.executables << 'tagbag'
end
