class TodosController < ApplicationController
    before_action :get_todo, only: [:destroy, :update]
    
    def index 
        @todos = Todo.all
        render json: @todos
    end

    def create
        @todo = Todo.new(todo_params)

        if @todo.save
            render json: {todo: @todo}
        else
            render json: {error: "Failed to create todo"}
        end
    end

    def destroy
        Todo.destroy(@todo)
        render json: { todo: "#{@todo.name} deleted" }, status: :accepted
    end

    def update
        @todo.update(todo_params)

        render json: { todo: "#{@todo.name} updated"}, status: :created
    end

    private 

    def get_todo
        Todo.find(params[:id])
    end

    def todo_params
        params.require(:todo).permit(:name, :description, :finished, :user_id)
    end
end
