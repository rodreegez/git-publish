require 'grit'

module Helpers
  def init
    git_dir = `git rev-parse --git-dir`
    repo = Grit::Repo.new(File.dirname(git_dir))
    @local_branch_name = repo.head.name
  end

  def origin(origin=nil)
    @origin ||= "origin"
  end

  def remote_branch_name(remote_branch_name=nil)
    @remote_branch_name ||= @local_branch_name
  end
end

