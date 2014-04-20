class TodoList.Models.Todo extends Backbone.Model
  paramRoot: 'todo'

  defaults:
    title: ''

class TodoList.Collections.TodosCollection extends Backbone.Collection
  model: TodoList.Models.Todo
  url: 'api/todos'

  initialize: ->
    @on('remove', @hideModel)

  hideModel: (model) ->
    model.trigger('hide')
