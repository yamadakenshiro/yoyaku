class RenamePriceColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :price, :total_amount_price
  end
end
