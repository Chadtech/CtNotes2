fissioning = require './app'
IndexView = require './pages/Index/Index.View'
NotFoundView = require './pages/NotFound/NotFound.View'

# Declare a variable that is a short form of fissioning.router.route
fissioning.router.route '/',
  title: 'CtNotes'
  view: IndexView
  el: 'content'

fissioning.router.route '*',
  title: 'Not Found'
  view: NotFoundView
  el:'content'

fissioning.router.start()