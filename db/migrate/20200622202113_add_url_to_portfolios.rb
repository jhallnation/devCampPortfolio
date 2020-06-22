class AddUrlToPortfolios < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :url, :string
  end
end
