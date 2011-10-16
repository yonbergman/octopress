class Octopress::Deploy::GithubPages

  # Answers the default configuration for this deployment strategy. This does
  # not include values that are managed in the Jekyll configuration, though the
  # deployment strategy may rely on anything from that configuration.
  #
  def self.default_config
    {
      'root':'/'
      'deploy_dir':'_deploy',
      'deploy_branch':'gh-pages'
    }
  end

  attr_reader :config

  def initialize(config)
    @config = self.class.default_config.merge(config)
  end

  # Invoked once when the deployment is first installed.
  #
  def install
    # TODO
  end

  def execute
    # TODO
  end

end
