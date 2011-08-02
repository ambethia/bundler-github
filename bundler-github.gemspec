Gem::Specification.new do |spec|
  spec.name        = 'bundler-github'
  spec.version     = '0.2.0'
  spec.authors     = ['Jason L Perry']
  spec.email       = ['jasper@ambethia.com']
  spec.homepage    = 'https://github.com/ambethia/bundler-github'
  spec.summary     = 'Gemfile shorthand for Github repos'
  spec.description = <<-EOF
    A hack for using shorthand like `:github => 'ambethia/recaptcha'` instead
    of a full git repository URI in your Gemfiles
  EOF

  spec.rubyforge_project = 'bundler-github'

  spec.files             = ['bin/bundle', 'lib/bundler/github.rb',
                            'lib/bundler/github/dsl_patch.rb',
                            'MIT-LICENSE', 'README.md']
  spec.test_files        = ['test/bundler_github_test.rb']
  spec.executables       = ['bundle']
  spec.require_paths     = ['lib']

  spec.add_dependency 'bundler'

  spec.add_development_dependency 'minitest' unless RUBY_VERSION >= "1.9"
  spec.add_development_dependency 'rake'
end
