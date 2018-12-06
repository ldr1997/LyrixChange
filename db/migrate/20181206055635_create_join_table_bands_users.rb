class CreateJoinTableBandsUsers < ActiveRecord::Migration[5.2]
  def change
  	create_join_table :bands, :users do |t|
  		# t.index [:band_id, :user_id]
  		# t.index[:user_id, :band_id]
  	end
  end
end
