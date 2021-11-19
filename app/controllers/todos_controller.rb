class TodosController < ApplicationController
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

    private 

    def todo_params
        params.require(:todo).permit(:name, :description, :finished, :user_id)
    end
end
