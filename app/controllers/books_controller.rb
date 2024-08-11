class BooksController < ApplicationController
  before_action :set_book, only: :show

  def show; end

  private

  def set_book
    @book = Book.search_by_isbn(params[:id])
  end
end
