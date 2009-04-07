# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{supermemo}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mat Holroyd"]
  s.date = %q{2009-04-07}
  s.description = %q{The SuperMemo (version SM-2) algorithm in ruby}
  s.email = %q{matholroyd+supermemo@gmail.com}
  s.extra_rdoc_files = ["lib/supermemo.rb", "README.rdoc"]
  s.files = ["lib/supermemo.rb", "Manifest", "Rakefile", "README.rdoc", "supermemo.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/matholroyd/supermemo}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Supermemo", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{supermemo}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{The SuperMemo (version SM-2) algorithm in ruby}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
