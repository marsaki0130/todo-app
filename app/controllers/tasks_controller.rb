

class TasksController < ApplicationController

  def index
    @tasks = Task.all #タスクを配列にして挿入
  end

def new
  @task = current_user.tasks.build
end

  def show
    @task = Task.find(params[:id])
    # @comments = @task.comments
  end

def create
  @task = current_user.tasks.build(task_params)
     if @task.save
       redirect_to task_path(@task),notice:'保存しました'
     else
       flash.now[:error] = '保存に失敗しました'
       render :new
     end
end

def edit
end

def update
end

def destroy
end

private
def task_params
    params.require(:task).permit(:title, :content, :eyecatch)
end

end
