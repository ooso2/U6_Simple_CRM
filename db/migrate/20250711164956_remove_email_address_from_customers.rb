class RemoveEmailAddressFromCustomers < ActiveRecord::Migration[8.0]
  def change
    remove_column :customers, :email_address, :string
  end
end
