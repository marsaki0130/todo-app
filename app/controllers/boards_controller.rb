class BoardsController < ApplicationController
  #  before_action :set_board, only: %i[show]
 
   def index  #記事一覧を表示するときは[index]をつけるのがルール
     @boards = Board.all
   end
 
   def show #特定の記事は[show]をつけるのがルール
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

   def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to board_path(@board),notice:'更新できました'
    else
      flash.now[:error] = '更新に失敗しました'
      render :edit
    end
  end

  private
  def board_params
    params.require(:board).permit(:name, :description) #permit = 許可する
  end

   def destroy
     board = Board.find(params[:id])
     board.destroy! #ビックリマークは削除が失敗したときに挙動が止まる
     redirect_to root_path, notice:'削除に成功しました'  #root_pathは記事一覧があるページ
   end
end