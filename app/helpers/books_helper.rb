module BooksHelper
  def format_isbn_number(number)
    number.insert(3, '-').insert(5, '-')
      .insert(12, '-').insert(15, '-')
  end
end