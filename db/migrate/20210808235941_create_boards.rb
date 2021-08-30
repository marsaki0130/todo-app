class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.references :user, null: false #ユーザIDがないと絶対に保存できない
      t.string :name, null: false #stringは短い文字列を保存する
      t.text :description, null: false #textは長い文字列を保存する
      t.timestamps
    end
  end
end
