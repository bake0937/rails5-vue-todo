module Api
  module V1
    class TodosController < ApplicationController
      protect_from_forgery :except => [:create,:update]

      #GET api/v1/todos
      def index
        @todos = Todo.all
        render json: @todos
      end

      # GET api/v1/todos/1
      def show
      end

      # GET api/v1/todos/new
      def new
        @todo = Todo.new
      end

      # GET api/v1/todos/1/edit
      def edit
      end

      # GET api/v1/todos
      def create
        @todo = Todo.new(todo_params)
        if @todo.save
          render json: { status: 'success'}
        else
          render json: { status: 'error' }
        end
      end

      # PATCH/PUT api/v1/todos/1
      def update
        @todo = Todo.find params[:id]
        if @todo.update(todo_params)
          render json: { status: 'success' }
        else
          render json: { status: 'error' }
        end
      end

      # DELETE api/v1/todos/1
      def destroy
        @todo = Todo.find params[:id]
        if @todo.destroy
          render json: { status: 'success' }
        else
          render json: { status: 'error' }
        end
      end

      private
        def set_todo
          @todo = Todo.find(params[:id])
        end

        def todo_params
          params.require(:todo).permit(:title, :comleted)
        end
    end
  end
end
