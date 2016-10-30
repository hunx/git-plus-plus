git = require '../../lib/git'
{repo} = require '../fixtures'
MergeNoffListView = require '../../lib/views/merge-noff-list-view'

describe "MergeNoffListView", ->
  beforeEach ->
    @view = new MergeNoffListView(repo, "branch1\nbranch2")
    spyOn(git, 'cmd').andCallFake -> Promise.resolve ''

  it "displays a list of branches", ->
    expect(@view.items.length).toBe 2

  it "calls git.cmd with 'merge branch1' when branch1 is selected", ->
    @view.confirmSelection()
    waitsFor -> git.cmd.callCount > 0
    expect(git.cmd).toHaveBeenCalledWith ['merge','--no-ff', 'branch1'], cwd: repo.getWorkingDirectory()
