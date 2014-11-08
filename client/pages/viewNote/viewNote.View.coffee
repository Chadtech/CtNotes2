fissioning = require '../../app'
Notes = require '../../models/notes'
{div, textarea, p, input, br, a} = fissioning.React.DOM

itemView = fissioning.modelView
  model: Notes
  init: ->
    addSubpoint: false
  remove: -> 
    @model.destroy()
    @model.save()
  render: -> 
    div {className: 'spacer'}
    div {className: 'indent'},
      div {className: 'heading'},
        p {className: 'pointHeading'}, (@model.get 'point')
      div {className: 'indent'}, ( (textToGive) ->
        paragraph = ''
        paragraphElements = []
        lastWasEnter = false
        for character in textToGive
          if character is '\n'
            if lastWasEnter
              paragraphElements.push br {}
            else
              paragraphElement = p({className:'point'}, paragraph)
              paragraphElements.push paragraphElement
              lastWasEnter = true
              paragraph = ''
          else
            lastWasEnter = false
            paragraph += character
        paragraphElement = p({className:'point'}, paragraph)
        paragraphElements.push paragraphElement
        paragraphElements.push br {}
        return paragraphElements) @model.get 'text'

module.exports =
  fissioning.collectionView
    model: Notes
    itemView: itemView
    render: ->
      
      #done = @collection.filter (note) -> note.get('done')

      div {className: 'content'},
        div {className: 'spacer'}
        textarea {className: 'title composition', placeholder:'title'}
        @items.map (item) ->
          console.log 'A', item
          item


