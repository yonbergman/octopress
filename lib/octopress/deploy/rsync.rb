# Provides an Rsync deployment strategy.
#
# Be sure your public key is listed in the target server's
# ~/.ssh/authorized_keys file, as this deployment strategy will use SSH as the
# remote shell. See the -e option of the rsync command ('man rsync').
#
class Octopress::Deploy::Rsync

  # Answers the default configuration for this deployment strategy. This does
  # not include values that are managed in the Jekyll configuration, though the
  # deployment strategy may rely on anything from that configuration.
  #
  def self.default_config
    {
      'ssh_user':'user@domain.com',
      'ssh_port':22,
      'document_root':'~/website.com/'
    }
  end

  attr_reader :config

  def initialize(config)
    @config = self.class.default_config.merge(config)
  end

  # Invoked once when the deployment is first installed.
  #
  def install
    # Nothing to do
  end

  def execute
    system "rsync -avze 'ssh -p #{config['ssh_port']}' --delete #{config['destination']}/ #{config['ssh_user']}:#{config['document_root']}"
  end
end
