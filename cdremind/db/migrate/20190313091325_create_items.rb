class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :jan
      t.string :title
      t.string :artist_name
      t.string :sales_date
      t.string :image_url
      t.string :item_url

      t.timestamps
    end
  end
end
