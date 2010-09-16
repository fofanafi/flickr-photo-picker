require 'test_helper'

class FlickrPhotosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flickr_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flickr_photo" do
    assert_difference('FlickrPhoto.count') do
      post :create, :flickr_photo => { }
    end

    assert_redirected_to flickr_photo_path(assigns(:flickr_photo))
  end

  test "should show flickr_photo" do
    get :show, :id => flickr_photos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => flickr_photos(:one).to_param
    assert_response :success
  end

  test "should update flickr_photo" do
    put :update, :id => flickr_photos(:one).to_param, :flickr_photo => { }
    assert_redirected_to flickr_photo_path(assigns(:flickr_photo))
  end

  test "should destroy flickr_photo" do
    assert_difference('FlickrPhoto.count', -1) do
      delete :destroy, :id => flickr_photos(:one).to_param
    end

    assert_redirected_to flickr_photos_path
  end
end
