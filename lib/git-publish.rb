require 'git-publish/helpers'

class GitPublish
  include Helpers
  def run
    init(ARGV[0], ARGV[1])
    %x|git push -u #{@origin} #{@local_branch_name}:refs/heads/#{@remote_branch_name}|
  end
end
