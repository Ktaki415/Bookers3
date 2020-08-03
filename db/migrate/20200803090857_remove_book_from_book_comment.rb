class RemoveBookFromBookComment < ActiveRecord::Migration[5.2]
  def change
    remove_column :book_comments, :book, :integer
  end
end
