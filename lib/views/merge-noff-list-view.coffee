fs = require 'fs-plus'
{$$, SelectListView} = require 'atom-space-pen-views'
git = require '../git'
OutputViewManager = require '../output-view-manager'
notifier = require '../notifier'

module.exports =
class MergeNoffListView extends MergeListView
    args:['merge','--no-ff']
