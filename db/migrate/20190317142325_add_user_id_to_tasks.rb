class AddUserIdToTasks < ActiveRecord::Migration[5.2]
  def up
    add_reference :tasks, :user, null:false, index:true
  end

  def cown
    remove_reference :tasks, :user, index:true
  end  
end
