class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
      @board = current_user.boards.build
    end

    def show
      @board = Board.find(params[:board_id])
      @task = Task.find(params[:id])
    end

    def create
      @task = current_user.tasks.build(task_params)
        if @task.save
            redirect_to board_path(board), notice: 'コメントを追加'
        else
            flash.now[:error] = '更新できませんでした'
            render :new
        end
    end

    private
  def task_params
    params.require(:task).permit(:title, :content)
  end
end