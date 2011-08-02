module Bundler::Github
  module DslPatch

    # The list of valid options is buried in this original method, so to add
    # an option without reimplementing (and duplicating) code, we rescue the
    # exception, and swap our :github option for :git, with the expanded URI
    def _normalize_options_with_github(*args)
      begin
        _normalize_options_without_github(*args)
      rescue Bundler::InvalidOption => exception
        if exception.message =~ /:github/
          Bundler::Github.expand_options(*args)
          retry
        else
          raise exception
        end
      end
    end

    def self.included(mod)
      mod.send :alias_method, :_normalize_options_without_github, :_normalize_options
      mod.send :alias_method, :_normalize_options, :_normalize_options_with_github
    end
  end
end
