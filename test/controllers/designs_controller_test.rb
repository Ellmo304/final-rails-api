require 'test_helper'

class DesignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @design = designs(:one)
  end

  test "should get index" do
    get designs_url, as: :json
    assert_response :success
  end

  test "should create design" do
    assert_difference('Design.count') do
      post designs_url, params: { design: { garden_id: @design.garden_id, name: @design.name } }, as: :json
    end

    assert_response 201
  end

  test "should show design" do
    get design_url(@design), as: :json
    assert_response :success
  end

  test "should update design" do
    patch design_url(@design), params: { design: { garden_id: @design.garden_id, name: @design.name } }, as: :json
    assert_response 200
  end

  test "should destroy design" do
    assert_difference('Design.count', -1) do
      delete design_url(@design), as: :json
    end

    assert_response 204
  end
end
