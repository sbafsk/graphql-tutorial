# frozen_string_literal: true

# AddUserIdLink
class AddUserIdLink < ActiveRecord::Migration[6.1]
  def change
    change_table :links do |t|
      t.references :user, foreign_key: true
    end
  end
end
