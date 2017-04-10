class CreateAnswerHierarchies < ActiveRecord::Migration
  def change
    create_table :answer_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :answer_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "answer_anc_desc_idx"

    add_index :answer_hierarchies, [:descendant_id],
      name: "answer_desc_idx"
  end
end
