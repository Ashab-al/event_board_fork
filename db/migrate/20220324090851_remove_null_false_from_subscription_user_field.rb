class RemoveNullFalseFromSubscriptionUserField < ActiveRecord::Migration[6.0]
  def change
    change_column :subscriptions, :user_id, :bigint, :null => true
  end
end
 