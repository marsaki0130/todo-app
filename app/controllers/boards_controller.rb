class BoardsController < ApplicationController
   before_action :set_board, only: [:show]

   def index
      @boards = Board.all
   end

   
   def new 
   end

   def create
   end
end