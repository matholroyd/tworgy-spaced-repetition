require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "tworgy-spaced-repetition"
    gem.summary = %Q{Spaced repetition algorithms and mixins}
    gem.description = %Q{A collection of spaced-reptetition algorithms and mixins e.g. SuperMemo}
    gem.email = "code@tworgy.com"
    gem.homepage = "http://github.com/matholroyd/tworgy-spaced-repetition"
    gem.authors = ["Mat Holroyd"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.files = %w(LICENSE README.rdoc Rakefile) + Dir.glob("{lib,spec}/**/*")
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "tworgy-spaced-repetition #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
