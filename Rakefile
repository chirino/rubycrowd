require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/packagetask'
require 'rake/gempackagetask'
require File.join(File.dirname(__FILE__), 'lib', 'crowd', 'version')

PKG_BUILD     = ENV['PKG_BUILD'] ? '.' + ENV['PKG_BUILD'] : ''
PKG_NAME      = 'rubycrowd'
PKG_VERSION   = Crowd::VERSION::STRING + PKG_BUILD
PKG_FILE_NAME = "#{PKG_NAME}-#{PKG_VERSION}"

RELEASE_NAME  = "REL #{PKG_VERSION}"

desc "Default Task"
task :default => [ :test ]

# Run the unit tests

desc "Run all unit tests"
task :test => [:test_crowd]

desc 'Crowd Integration Tests'
Rake::TestTask.new(:test_crowd) do |t|
  t.libs << "test"
  t.test_files = Dir.glob("test/*_test.rb")
  t.verbose = true
end

# Generate the RDoc documentation

Rake::RDocTask.new { |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title    = "Ruby Crowd -- Integrating Ruby with Atlassian Crowd"
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.template = "#{ENV['template']}.rb" if ENV['template']
  if ENV['DOC_FILES'] 
    rdoc.rdoc_files.include(ENV['DOC_FILES'].split(/,\s*/))
  else
    rdoc.rdoc_files.include('README', 'RUNNING_UNIT_TESTS')
    rdoc.rdoc_files.include('lib/**/*.rb')
    # generated code will just muddy the API
    rdoc.rdoc_files.exclude('lib/**/default*.rb')
  end
}

# Create compressed packages
dist_dirs = [ "lib", "test", "examples" ]

spec = Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = PKG_NAME
  s.version = PKG_VERSION
  s.summary = "Integrating Ruby with Atlassian Crowd."
  #s.description = %q{Eases web-request routing, handling, and response as a half-way front, half-way page controller. Implemented with specific emphasis on enabling easy unit/integration testing that doesn't require a browser.} #'

  s.author = "Don Coleman"
  s.email = "dcoleman@chariotsolutions.com"
  s.homepage = "http://www.chariotsolutions.com"

  s.has_rdoc = true
  s.requirements << 'Crowd identity management server.'

  s.add_dependency('soap4r', '>= 1.5.6' + PKG_BUILD)

  s.require_path = 'lib'

  #s.files = [ "Rakefile", "install.rb", "README", "RUNNING_UNIT_TESTS", "CHANGELOG", "MIT-LICENSE", "examples/.htaccess" ]
  s.files = [ "Rakefile", "README", "RUNNING_UNIT_TESTS"]
  dist_dirs.each do |dir|
    s.files = s.files + Dir.glob( "#{dir}/**/*" ).delete_if { |item| item.include?( "\.svn" ) }
  end
  #s.files.delete "examples/benchmark.rb"
  #s.files.delete "examples/benchmark_with_ar.fcgi"
end
  
Rake::GemPackageTask.new(spec) do |p|
  p.gem_spec = spec
  p.need_tar = true
  p.need_zip = true
end

task :lines do
  lines, codelines, total_lines, total_codelines = 0, 0, 0, 0

  for file_name in FileList["lib/**/*.rb", "test/**/*.rb"]
    next if file_name =~ /vendor/
    f = File.open(file_name)

    while line = f.gets
      lines += 1
      next if line =~ /^\s*$/
      next if line =~ /^\s*#/
      codelines += 1
    end
    puts "L: #{sprintf("%4d", lines)}, LOC #{sprintf("%4d", codelines)} | #{file_name}"
    
    total_lines     += lines
    total_codelines += codelines
    
    lines, codelines = 0, 0
  end

  puts "Total: Lines #{total_lines}, LOC #{total_codelines}"
end


# Publishing ------------------------------------------------------

# desc "Publish the API documentation"
# task :pgem => [:package] do 
#   Rake::SshFilePublisher.new("davidhh@wrath.rubyonrails.org", "public_html/gems/gems", "pkg", "#{PKG_FILE_NAME}.gem").upload
#   `ssh davidhh@wrath.rubyonrails.org './gemupdate.sh'`
# end

# desc "Publish the release files to RubyForge."
# task :release => [ :package ] do
#   require 'rubyforge'
# 
#   packages = %w( gem tgz zip ).collect{ |ext| "pkg/#{PKG_NAME}-#{PKG_VERSION}.#{ext}" }
# 
#   rubyforge = RubyForge.new
#   rubyforge.login
#   rubyforge.add_release(PKG_NAME, PKG_NAME, "REL #{PKG_VERSION}", *packages)
# end