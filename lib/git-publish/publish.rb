require 'grit'

class GitPublish
  def run
    git_dir = `git rev-parse --git-dir`
    repo = Grit::Repo.new(File.dirname(git_dir))
    @local_branch_name = repo.head.name
    origin(ARGV[0])
    remote_branch_name(ARGV[1])
    %x|git push #{origin} #{@local_branch_name}:refs/heads/#{remote_branch_name}|
    %x|git fetch #{origin}|
    %x|git branch --track #{@local_branch_name} #{origin}/#{remote_branch_name}|
    %x|git checkout #{@local_branch_name}|
  end

  def origin(origin=nil)
    @origin ||= "origin"
  end

  def remote_branch_name(remote_branch_name=nil)
    @remote_branch_name ||= @local_branch_name
  end
end
