fissioning = require '../app'

module.exports = 
  fissioning.model
    props:
      point: 'string'
      text: 'string'
      addSubpoint: 'boolean'
      subpoints: 'array'