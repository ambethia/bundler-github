require 'bundler'
require 'bundler/github/dsl_patch'

module Bundler

  module Github

    URI = lambda { |user, repo| "git://github.com/#{user}/#{repo}.git" }

    def self.expand_options(name, version, opts)
      user, repo  = opts.delete('github').split('/')
      opts['git'] = URI.call(user, repo || name)
    end
  end

  Bundler::Dsl.send(:include, Bundler::Github::DslPatch)
end
