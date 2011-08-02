require 'bundler'
require 'bundler/github/dsl_patch'

module Bundler

  module Github

    HTTP = lambda { |user, repo| "https://github.com/#{user}/#{repo}.git" }
    SSH  = lambda { |user, repo| "git@github.com:#{user}/#{repo}.git" }

    def self.expand_options(name, version, opts)
      user, repo  = opts.delete('github').split('/')
      transport   = user =~ /^:/ ? (user.slice!(0); SSH) : HTTP
      opts['git'] = transport.call(user, repo || name)
    end
  end

  Bundler::Dsl.send(:include, Bundler::Github::DslPatch)
end
