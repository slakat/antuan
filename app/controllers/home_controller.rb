class HomeController < ApplicationController

  def index
    @worker = Worker.new
  end
end
