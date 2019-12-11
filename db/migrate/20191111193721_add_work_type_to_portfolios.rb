class AddWorkTypeToPortfolios < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :work_type, :string
  end
end
