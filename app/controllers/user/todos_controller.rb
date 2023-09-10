class User::TodosController < User::Base
    before_action :check_user_signed_in?, except:[:index]
    def index
        @todos = Todo.all
        if user_signed_in?
            if params[:user] == "others"
                @todos.where(user: current_user)
            else
                @todos.where.not(user: current_user)
            end
        end
        @todos = @todos.page(params[:page]).per(5)
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def new
        @todo = Todo.new()
        @user = User.new
    end

    def create
        @todo = Todo.new(todo_params)
        @todo.user = current_user
        if @todo.save
            flash.notice = '作成しました。'
            redirect_to user_todo_path(@todo.id)
        else
            render "user/todos/new"
        end
    end

    def achieve
        @todo = Todo.find(params[:id])
        @todo.update(
            achieved_at: DateTime.now
        )
        flash.notice = '達成しました。'
        redirect_to user_todo_path(@todo.id)
    end

    def fail
        @todo = Todo.find(params[:id])
        @todo.update(
            failed_at: DateTime.now
        )
        flash.notice = '失敗しました。'
        redirect_to user_todo_path(@todo.id)
    end

    def todo_params
        params.require(:todo).permit(:title, :description, :price, :deadline, :how_to_judge, :other_user_email)
    end

end
