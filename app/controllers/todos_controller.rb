# resources :todos
# CRUD API for todos app

# Generated migration file and db schema. Check out ruby guide

# A frequent practice is to place the standard CRUD actions in each
# controller in the following order:
# index, show, new, edit, create, update and destroy.

# keep in mind that these are public methods; they must be placed
# before declaring private visibility in the controller.
class TodosController < ApplicationController
  def show
    @todo = Todo.find(params[:id])
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

  private

  def todo_params
    params.require(:todo).permit(:name, :description)
  end
end
