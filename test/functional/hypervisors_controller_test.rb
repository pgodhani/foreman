require 'test_helper'

class HypervisorsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Hypervisor.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Hypervisor.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to hypervisors_url
  end

  def test_edit
    get :edit, :id => Hypervisor.first
    assert_template 'edit'
  end

  def test_update_invalid
    Hypervisor.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Hypervisor.first
    assert_template 'edit'
  end

  def test_update_valid
    Hypervisor.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Hypervisor.first
    assert_redirected_to hypervisors_url
  end

  def test_destroy
    hypervisor = Hypervisor.first
    delete :destroy, :id => hypervisor
    assert_redirected_to hypervisors_url
    assert !Hypervisor.exists?(hypervisor.id)
  end
end