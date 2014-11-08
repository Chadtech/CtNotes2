Fission = require 'fission'
SyncAdapter = require 'fission-sync-localstorage'

fission = new Fission
  sync: SyncAdapter
  #sync: (method, model, options) -> console.log 'Sync Occured : ', method, model, options

module.exports = fission