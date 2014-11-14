class ChangeBadData < ActiveRecord::Migration
  def change
    Organization.where(active:nil).update_all(active:false)
    Organization.where(name:nil).delete_all
    Organization.where(name:"").delete_all
    Organization.where(name:" ").delete_all
    Person.where("date_of_birth <=?", 100.years.ago).delete_all
  end
end
