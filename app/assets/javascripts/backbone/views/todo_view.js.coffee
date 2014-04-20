class TodoList.Views.TodoView extends Backbone.View
  template: _.template("<%= title %>")

  tagName: "span"

  className: "todo"

  initialize: ->
    @model.on('hide', @remove, @)

  render: ->
    @$el.html(@template(@model.toJSON()))
    return this

class TodoList.Views.TodoListView extends Backbone.View
  el: "#todos"

  initialize: ->
    @collection.on('add', @addOne, @)
    @collection.on('reset', @addAll, @)

  render: ->
    @addAll

  addAll: ->
    @collection.forEach(@addOne, @)

  addOne: (model) ->
    @todoView = new TodoList.Views.TodoView({model: model})
    @$el.append(@todoView.render().el)