class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :priority

      t.timestamps
    end

    Category.create!(name: 'Substrate', priority: 1)
    Category.create!(name: 'Inoculation', priority: 2)
    Category.create!(name: 'Incubation', priority: 3)
    Category.create!(name: 'Fruiting', priority: 4)
    Category.create!(name: 'Harvesting', priority: 5)
    Category.create!(name: 'Mushroom Strains', priority: 6)
  end
end
