require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  
  test "should_not_save_role_without_parameters" do
    role = Role.new
    assert !role.save, "Saved the role without any parameters"
  end
  
  test "should_save_role_without_description" do
    role = Role.new
    role.name = "Rolename"
    assert role.save, "Saved the role without description"
  end
  
  test "should_not_save_role_without_name" do
    role = Role.new
    role.description = "Role description"
    assert !role.save, "Saved the role without name"
  end  
  
end
