require 'test_helper'

class GradYearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grad_year = grad_years(:one)
  end

  test "should get index" do
    get grad_years_url
    assert_response :success
  end

  test "should get new" do
    get new_grad_year_url
    assert_response :success
  end

  test "should create grad_year" do
    assert_difference('GradYear.count') do
      post grad_years_url, params: { grad_year: { year: @grad_year.year } }
    end

    assert_redirected_to grad_year_url(GradYear.last)
  end

  test "should show grad_year" do
    get grad_year_url(@grad_year)
    assert_response :success
  end

  test "should get edit" do
    get edit_grad_year_url(@grad_year)
    assert_response :success
  end

  test "should update grad_year" do
    patch grad_year_url(@grad_year), params: { grad_year: { year: @grad_year.year } }
    assert_redirected_to grad_year_url(@grad_year)
  end

  test "should destroy grad_year" do
    assert_difference('GradYear.count', -1) do
      delete grad_year_url(@grad_year)
    end

    assert_redirected_to grad_years_url
  end
end
