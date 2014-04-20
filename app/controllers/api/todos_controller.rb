class Api::TodosController < ApplicationController
  before_filter :get_todo, only: [:show, :update]

  def index
    todos = Todo.all
    render_json todos
  end

  def show
    render_json @todo
  end

  def create
    render_json Todo.create(permit_params)
  end

  def update
    @todo.update_attributes permit_params
    render_json @todo
  end

  private

  def permit_params
    # Rails 4+ has strong params
    params.require(:todo).permit(:title)
  end

  def get_todo
    @todo = Todo.find(params[:id])
  end

  def render_json(model)
    render json: model, status: :ok
  end
end
