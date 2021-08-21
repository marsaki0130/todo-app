class CommentsController < ApplicationController

    def new
        @task = Task.find(params[:task_id])
        @comment = task.comments.build
    end

    def create
        task = Task.find(params[:task_id])
        @comment = task.comments.build(comment_params)
        @comment.user = current_user
        if @comment.save
            redirect_to task_path(task), notice: 'コメントを追加'
        else    
            flash.now[:error] = '更新できませんでした'
            render :new
        end
    end
end