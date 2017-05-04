# resources :todos
# CRUD API for todos app

# Generated migration file and db schema. Check out ruby guide

# A frequent practice is to place the standard CRUD actions in each
# controller in the following order:
# index, show, new, edit, create, update and destroy.

# keep in mind that these are public methods; they must be placed
# before declaring private visibility in the controller.
class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def index
    @todos = Todo.all
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def edit
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = 'Todo was created successfully'
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end

  def update
    if @todo.update(todo_params)
      flash[:notice] = 'Todo was updated successfully'
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end

  def destroy
    @todo.destroy
    flash[:notice] = 'Todo deleted'
    redirect_to todos_path
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name, :description)
  end
end
