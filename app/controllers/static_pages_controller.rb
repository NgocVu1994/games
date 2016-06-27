class StaticPagesController < ApplicationController
  def home
    @games = Game.all
    @message = Message.new
  end

  def help
  end
end
