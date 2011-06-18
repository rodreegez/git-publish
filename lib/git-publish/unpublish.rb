require 'grit'

class GitUnpublish
  def run
    git_dir = `git rev-parse --git-dir`
    repo = Grit::Repo.new(File.dirname(git_dir))
    @local_branch_name = repo.head.name
    origin(ARGV[0])
    remote_branch_name(ARGV[1])
    %x|git push #{origin} :#{remote_branch_name}|
    puts %Q|
Remote branch deleted.
Run \`git branch -d #{@local_branch_name}\`
to delete the branch locally|
  end

  def origin(origin=nil)
    @origin ||= "origin"
  end

  def remote_branch_name(remote_branch_name=nil)
    @remote_branch_name ||= @local_branch_name
  end
end

