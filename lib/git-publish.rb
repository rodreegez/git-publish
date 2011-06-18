require 'grit'

class GitPublish
  def run
    git_dir = `git rev-parse --git-dir`
    repo = Grit::Repo.new(File.dirname(git_dir))
    current_branch_name = repo.head.name
    p current_branch_name
  end
end
