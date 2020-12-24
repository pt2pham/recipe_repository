Hanami::Model.migration do
  change do
    create_table :recipes do
      primary_key :id

      column :name, String, null: false
      column :difficulty, Float, null: false
      column :food_type, String, null: false
      column :serving_size, String, null: false
      column :duration, Integer, null: false
      column :ingredients, String, null: false # I might make this be a relation to an Ingredients model 
      column :instructions, String, null: false
      column :notes, String
      column :tags, String
      column :image, String, default: 'https://www.ilac.com/wp-content/uploads/2019/06/placeholder-600x400.png'
      
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
