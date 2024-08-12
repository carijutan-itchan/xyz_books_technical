class HomeController < ApplicationController

  def index
    @books = Book.limit(3)
  end
end
