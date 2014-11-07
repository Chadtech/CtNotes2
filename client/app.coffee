Fission = require 'fission'

fission = new Fission
  # Try removing this to see what happens
  sync: -> console.log 'Sync Occured'

module.exports = fission