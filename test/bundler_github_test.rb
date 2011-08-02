require 'minitest/unit'
require 'minitest/autorun'
require 'bundler/github'

class BundlerGithubTest < MiniTest::Unit::TestCase

  # Let's get meta.
  def setup
    @gem = @repo = 'bundler-github'
    @uri = lambda { "git://github.com/ambethia/#{@repo}.git" }
  end

  def test_expands_uri
    assert_equal @uri.call, expand('ambethia/bundler-github')
  end

  def test_expands_uri_with_distinct_gem_name
    @gem = 'bundler_github'
    assert_equal @uri.call, expand('ambethia/bundler-github')
  end

  def test_expands_uri_with_distinct_repo_name
    @repo = 'bundler_github'
    assert_equal @uri.call, expand('ambethia/bundler_github')
  end

  def test_expands_uri_with_implicit_gem_name
    assert_equal @uri.call, expand('ambethia')
  end

  def expand(repository)
    { 'github' => repository }.tap { |opts|
      Bundler::Github.expand_options(@gem, nil, opts)
    }['git']
  end
end
