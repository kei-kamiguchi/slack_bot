class CreateChatbots < ActiveRecord::Migration[6.0]
  def change
    create_table :chatbots do |t|
      t.string :name
      t.text :message

      t.timestamps
    end
  end
end
