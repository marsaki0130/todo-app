class BoardsController < ApplicationController
   before_action :set_board, only: %i[show]
 
   def index  #記事一覧を表示するときは[index]をつけるのがルール
     @boards = Board.all
   end
 
   def show
     @board = Board.find(params[:id])
   end
 
   def new
    @board = current_user.boards.build
   end

   def create #new
     @board = current_user.boards.build(board_params)
     if @board.save
       redirect_to root_path(@board)
     else
       render :new
     end
   end
end