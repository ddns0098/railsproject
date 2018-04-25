require 'test_helper'

class DragonflyImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dragonfly_image = dragonfly_images(:one)
  end

  test "should get index" do
    get dragonfly_images_url
    assert_response :success
  end

  test "should get new" do
    get new_dragonfly_image_url
    assert_response :success
  end

  test "should create dragonfly_image" do
    assert_difference('DragonflyImage.count') do
      post dragonfly_images_url, params: { dragonfly_image: {  } }
    end

    assert_redirected_to dragonfly_image_url(DragonflyImage.last)
  end

  test "should show dragonfly_image" do
    get dragonfly_image_url(@dragonfly_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_dragonfly_image_url(@dragonfly_image)
    assert_response :success
  end

  test "should update dragonfly_image" do
    patch dragonfly_image_url(@dragonfly_image), params: { dragonfly_image: {  } }
    assert_redirected_to dragonfly_image_url(@dragonfly_image)
  end

  test "should destroy dragonfly_image" do
    assert_difference('DragonflyImage.count', -1) do
      delete dragonfly_image_url(@dragonfly_image)
    end

    assert_redirected_to dragonfly_images_url
  end
end
