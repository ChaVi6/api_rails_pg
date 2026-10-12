class AddColumnDeletedToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :deleted, :boolean, default: false
  end
end