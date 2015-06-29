require 'test_helper'

class JobHasFunctionsControllerTest < ActionController::TestCase
  setup do
    @job_has_function = job_has_functions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_has_functions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_has_function" do
    assert_difference('JobHasFunction.count') do
      post :create, job_has_function: { function_id: @job_has_function.function_id, job_id: @job_has_function.job_id }
    end

    assert_redirected_to job_has_function_path(assigns(:job_has_function))
  end

  test "should show job_has_function" do
    get :show, id: @job_has_function
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_has_function
    assert_response :success
  end

  test "should update job_has_function" do
    patch :update, id: @job_has_function, job_has_function: { function_id: @job_has_function.function_id, job_id: @job_has_function.job_id }
    assert_redirected_to job_has_function_path(assigns(:job_has_function))
  end

  test "should destroy job_has_function" do
    assert_difference('JobHasFunction.count', -1) do
      delete :destroy, id: @job_has_function
    end

    assert_redirected_to job_has_functions_path
  end
end
