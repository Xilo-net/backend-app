require "test_helper"

class GroupResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_resource = group_resources(:one)
  end

  test "should get index" do
    get group_resources_url, as: :json
    assert_response :success
  end

  test "should create group_resource" do
    assert_difference("GroupResource.count") do
      post group_resources_url, params: { group_resource: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show group_resource" do
    get group_resource_url(@group_resource), as: :json
    assert_response :success
  end

  test "should update group_resource" do
    patch group_resource_url(@group_resource), params: { group_resource: {  } }, as: :json
    assert_response :success
  end

  test "should destroy group_resource" do
    assert_difference("GroupResource.count", -1) do
      delete group_resource_url(@group_resource), as: :json
    end

    assert_response :no_content
  end
end
