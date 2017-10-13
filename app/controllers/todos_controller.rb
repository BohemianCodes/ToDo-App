class TodosController < ApplicationController

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "To-do was created successfully"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end

  def show
    set_todo_id
  end

  def edit
    set_todo_id
  end

  def update
    set_todo_id
    if @todo.update(todo_params)
      flash[:notice] = "To-do was updated successfully"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end

  def index
    @todos = Todo.all
  end

  def destroy
    set_todo_id
    @todo.destroy
    flash[:notice] = "Todo was destroyed successfully"
    redirect_to todos_path
  end

  private
    def todo_params
      params.require(:todo).permit(:name, :description)
    end

    def set_todo_id
      @todo = Todo.find(params[:id])
    end


end
