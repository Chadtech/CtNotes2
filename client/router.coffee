fissioning = require './app'
IndexView = require './pages/Index/Index.View'
viewNoteView = require './pages/viewNote/viewNote.View'

route = fissioning.router.route

route '/',
  title: 'CtNotes2'
  view: IndexView
  el: 'content'

route '/view',
  title: 'CtNotes2'
  view: viewNoteView
  el:'content'

fissioning.router.start()