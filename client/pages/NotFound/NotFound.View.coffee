fissioning = require '../../app'
{div, p} = fissioning.React.DOM

module.exports = ->
  fissioning.view
    render: ->
      div {className: 'content'},
        p {}, 'NOT FOUND'