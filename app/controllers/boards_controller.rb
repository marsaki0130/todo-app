class BoardsController < ApplicationController
   before_action :set_board, only: [:show]
 def index
    @boards = Board.all
 end

#  def new #フォームを表示　ログインユーザーをviewに渡す
#    @board = current_user.boards.build 
#  end
end