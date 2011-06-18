require 'git-publish/helpers'

class GitPublish
  include Helpers
  def run
    init
    origin(ARGV[0])
    remote_branch_name(ARGV[1])
    %x|git push #{origin} #{@local_branch_name}:refs/heads/#{remote_branch_name}|
    %x|git fetch #{origin}|
    %x|git branch --track #{@local_branch_name} #{origin}/#{remote_branch_name}|
    %x|git checkout #{@local_branch_name}|
  end
end
