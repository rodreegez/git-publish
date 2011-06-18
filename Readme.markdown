# Usage #

    $ git co -b my-test-branch
    $ git publish
    => create a remote branch called my-test-branch
    and track it locally

    $ git co -b my-test-branch
    $ git publish heroku
    => create a remote branch on "heroku" origin
    rather than the default "origin"

    $ git co -b my-test-branch
    $ git publish heroku development
    => publish my-test-branch on heroku and call it
    development

    $ git co -b my-test-branch
    $ git publish origin feature-36
    => publish my-test-branch on default "origin"
    and call it "feature-36"

# Inspiration #

Part proof-of-concept, part laziyness. I borrowed a lot
of ideas from [git-up](https://github.com/aanand/git-up) and [git_remote_branch](https://github.com/webmat/git_remote_branch).




