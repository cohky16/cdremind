class AddAvailabilityToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :availability, :string
  end
end
