class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
    end

    def create
        board = Board.find(params[:board_id])
        @task = board.tasks.build(task_params)
        @task.user = current_user
     if @task.save
        redirect_to board_path(board),notice:'タスクを追加'
     else
        flash.now[:error] = '更新できませんでした'
        render:new
     end
    end

    private
  def task_params
    params.require(:task).permit(:title, :content) #permit = 許可する
  end
end