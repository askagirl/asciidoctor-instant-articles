# -*- encoding: utf-8 -*-
require File.expand_path '../lib/asciidoctor-instant-articles/version', __FILE__

Gem::Specification.new do |s|
  s.name = 'asciidoctor-instant-articles'
  s.version = Asciidoctor::InstantArticles::VERSION
  s.authors = ['Fritz Lee']
  s.email = ['askagirl@gmail.com']
  s.homepage = 'https://github.com/askagirl/asciidoctor-instant-articles'
  s.summary = 'Converts AsciiDoc to HTML for an Instant Articles'
  s.description = 'Instant Articles back-end for Asciidoctor.'
  s.license = 'MIT'
  s.required_ruby_version = '>= 1.9.3'
  s.date = '2017-03-05'

  files = begin
    (result = Open3.popen3('git ls-files -z') {|_, out| out.read }.split %(\0)).empty? ? Dir['**/*'] : result
  rescue
    Dir['**/*']
  end
  s.files = files.grep %r/^(?:(?:lib|templates)\/.+|Gemfile|Rakefile|(?:CHANGELOG|LICENSE|README)\.adoc|#{s.name}\.gemspec)$/


  s.executables = ['asciidoctor-instant-articles']
  s.extra_rdoc_files = Dir['README.adoc', 'LICENSE.adoc', 'HACKING.adoc']
  s.require_paths = ['lib']

  s.add_runtime_dependency 'asciidoctor', '~> 1.5.4'
  s.add_runtime_dependency 'slim', '~> 3.0.6'
  s.add_runtime_dependency 'thread_safe', '~> 0.3.5'

  s.add_development_dependency 'rake', '~> 10.4.2'
  s.add_development_dependency 'bundler', '~> 1.14'
  s.add_development_dependency 'rspec', '~> 3.0'
end

