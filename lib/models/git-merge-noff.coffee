git = require '../git'
MergeNoffListView = require '../views/merge-noff-list-view'

module.exports = (repo, {remote}={}) ->
  args = ['branch']
  args.push '-r' if remote
  git.cmd(args, cwd: repo.getWorkingDirectory())
  .then (data) -> new MergeNoffListView(repo, data)
