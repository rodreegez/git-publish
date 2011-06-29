require 'grit'

module Helpers
  def init(origin=nil, remote_branch_name=nil)
    git_dir = `git rev-parse --git-dir`
    repo = Grit::Repo.new(File.dirname(git_dir))
    @local_branch_name = repo.head.name
    @remote_branch_name ||= @local_branch_name
    @origin ||= "origin"
  end
end

