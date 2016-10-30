{repo} = require '../fixtures'
git = require '../../lib/git'
GitMergeNoff = require '../../lib/models/git-merge-noff'

describe "GitMergeNoff", ->
  describe "when called with no options", ->
    it "calls git.cmd with 'branch'", ->
      spyOn(git, 'cmd').andReturn Promise.resolve ''
      GitMergeNoff(repo)
      expect(git.cmd).toHaveBeenCalledWith ['branch'], cwd: repo.getWorkingDirectory()

  describe "when called with { remote: true } option", ->
    it "calls git.cmd with 'remote branch'", ->
      spyOn(git, 'cmd').andReturn Promise.resolve ''
      GitMergeNoff(repo, remote: true)
      expect(git.cmd).toHaveBeenCalledWith ['branch', '-r'], cwd: repo.getWorkingDirectory()
