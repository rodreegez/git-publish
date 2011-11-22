require 'git-publish/helpers'

class GitUnpublish
  include Helpers
  def run
    init(ARGV[0], ARGV[1])
    DANGER = %w[test development master dev develop staging production]
    if DANGER.include? @remote_branch_name
      puts "It looks like you are trying to delete an important branch. Are you sure you want to continue?"
      puts "type \"delete #{@remote_branch_name}\" (without quotes) to continue."
      continue = gets.strip
      if contunue != "delete #{@remote_branch_name}"
        puts "aborting"
      else
        %x|git push #{@origin} :#{@remote_branch_name}|
        puts %Q|\n  Run \`git branch -d #{@local_branch_name}\` to delete the branch locally\n |
      end
    end
  end
end

