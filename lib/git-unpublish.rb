require 'git-publish/helpers'

class GitUnpublish
  include Helpers
  def run
    init(ARGV[0], ARGV[1])
    %x|git push #{@origin} :#{@remote_branch_name}|
    puts %Q|\n  Run \`git branch -d #{@local_branch_name}\` to delete the branch locally\n |
  end
end

