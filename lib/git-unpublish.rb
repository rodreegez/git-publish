require 'git-publish/helpers'

class GitUnpublish
  include Helpers
  def run
    init
    origin(ARGV[0])
    remote_branch_name(ARGV[1])
    %x|git push #{origin} :#{remote_branch_name}|
    puts %Q|\n  Run \`git branch -d #{@local_branch_name}\` to delete the branch locally\n |
  end
end

