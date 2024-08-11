# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Book.destroy_all
Author.destroy_all
Publisher.destroy_all

  book1_path = Rails.root.join('db/assets/donuts.png')
  book2_path = Rails.root.join('db/assets/welder.png')
  book3_path = Rails.root.join('db/assets/bend.png')

  signed_blob_1 = ActiveStorage::Blob.create_and_upload!(
    io: File.open(book1_path),
    filename: 'donuts',
    content_type: 'image/png:',
  ).signed_id

  signed_blob_2 = ActiveStorage::Blob.create_and_upload!(
    io: File.open(book2_path),
    filename: 'welder',
    content_type: 'image/png:',
  ).signed_id

  signed_blob_3 = ActiveStorage::Blob.create_and_upload!(
    io: File.open(book3_path),
    filename: 'bend',
    content_type: 'image/png:',
  ).signed_id

  ActiveRecord::Base.transaction do
  # create author
    Author.create(
      [
        {
          first_name: 'Joel',
          last_name: 'Hartse',
        },
        {
          first_name: 'Hannah',
          middle_name: 'P',
          last_name: 'Templer',
        },
        {
          first_name: 'Marguerite',
          middle_name: 'Z',
          last_name: 'Duras',
        },
        {
          first_name: 'Kingsley',
          last_name: 'Amis',
        },
        {
          first_name: 'Fannie',
          middle_name: 'Peters',
          last_name: 'Flagg',
        },
        {
          first_name: 'Camille',
          middle_name: 'Byron',
          last_name: 'Paglia,',
        },
        {
          first_name: 'Rainer',
          middle_name: 'Steel',
          last_name: 'Rilke,',
        },
      ]
    )

    Publisher.create(
      [
        {
          name: 'Paste Magazine'
        },
        {
          name: 'Publishers Weekly'
        },
        {
          name: 'Graywolf Press'
        },
        {
          name: "McSweeney's"
        }
      ]
    )
    
    book_1_authors = Author.where(last_name: ['Hartse', 'Templer', 'Duras'])
    book_1_publisher = Publisher.find_by(name: 'Paste Magazine')

    book_2_authors = Author.where(last_name: 'Amis')
    book_2_publisher = Publisher.find_by(name: 'Publishers Weekly')

    book_3_authors = Author.where(last_name: 'Amis')
    book_3_publisher = Publisher.find_by(name: 'Graywolf Press')

    Book.create!(
      [
        {
          title: "American Elf",
          isbn_number_13: "9781891830853",
          isbn_number_10: "1891830856",
          price: 1000.00,
          publish_at: "2004-03-21",
          authors: book_1_authors,
          publisher: book_1_publisher,
          book_cover: signed_blob_1,
          edition: 'Book 2'
        },
        {
          title: "Cosmoknights",
          isbn_number_13: "9781603094542",
          isbn_number_10: "1603094547",
          price: 2000.00,
          publish_at: "2019-03-21",
          authors: book_2_authors,
          publisher: book_2_publisher,
          book_cover: signed_blob_2
        },
        {
          title: "Essex County",
          isbn_number_13: "9781603090384",
          isbn_number_10: "160309038X",
          price: 500.00,
          publish_at: "1990-03-21",
          authors: book_3_authors,
          publisher: book_3_publisher,
          book_cover: signed_blob_3
        },
      ]
    )
  end


p "Created #{Book.count} Books"