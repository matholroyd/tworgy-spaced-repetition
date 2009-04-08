require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('supermemo', '0.1.1') do |p|
  p.description = 'The SuperMemo algorithm (version SM-2) in ruby'
  p.url = 'http://github.com/matholroyd/supermemo'
  p.author = 'Mat Holroyd'
  p.email = 'matholroyd+supermemo@gmail.com'
  p.ignore_pattern = ['tmp/*', 'script/*']
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }