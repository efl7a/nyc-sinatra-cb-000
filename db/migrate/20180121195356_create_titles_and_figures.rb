class CreateTitlesAndFigures < ActiveRecord::Migration[5.1]
  def change
    create_table :titles do |t|
      t.string :name
    end
  
    create_table :figures do |t|
      t.string :name
    end
  end
end
