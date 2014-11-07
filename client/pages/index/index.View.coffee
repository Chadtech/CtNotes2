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
        input {className:'button remove', type:'submit', onClick:@remove, value:'X'}
      div {className: 'indent'}, ( (textToGive)->
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
    addPoint: (event) ->
      pointValue = document.getElementById('point').value 
      pointHeadingValue = document.getElementById('pointHeading').value
      pointFilled = not (pointValue is '')
      headingFilled = not (pointHeadingValue is '')
      if pointFilled and headingFilled
        @collection.create text: document.getElementById('point').value, point: document.getElementById('pointHeading').value
        document.getElementById('point').value = ''
        document.getElementById('point').className = 'point composition'
        document.getElementById('pointHeading').value = ''
        document.getElementById('pointHeading').className = 'pointHeading composition'
      else 
        if not pointFilled
          document.getElementById('point').className += ' error'
        if not headingFilled
          document.getElementById('pointHeading').className += ' error'
 
    addSubpoint: (event) ->
      console.log 'B'
    render: ->
      
      #done = @collection.filter (note) -> note.get('done')

      div {className: 'content'},
        div {className: 'spacer'}
        textarea {className: 'title composition', placeholder:'title'}
        @items.map (item) ->
          item
        div {className: 'indent'},
          textarea {className: 'pointHeading composition', id:'pointHeading', spellCheck:'false', placeholder:'header'}
          div {className: 'indent'},
            textarea {className: 'point composition', id:'point', spellCheck:'false', placeholder:'point'}
          input {className: 'button', type:'submit', id:'subpointSubmit', onClick: @addSubpoint, value:'Add Subpoint'}
          input {className: 'button', type:'submit', id:'pointSubmit', onClick: @addPoint, value:'Add Point'}
        #div {className: 'spacer'}


