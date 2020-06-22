class AddLogoToPortfolios < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :logo, :text
  end
end
