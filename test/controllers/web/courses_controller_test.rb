require 'test_helper'

class Web::CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)

    @user = users(:one)
    sign_in @user
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create course' do
    assert_difference('Course.count') do
      post :create, course: { category_id: @course.category_id, description: @course.description, name: @course.name }
    end

    assert_redirected_to controller: 'backend', action: 'courses'
  end

  test 'should show course' do
    get :show, id: @course
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @course
    assert_response :success
  end

  test 'should update course' do
    patch :update, id: @course, course: { category_id: @course.category_id, description: @course.description, name: @course.name }
    assert_redirected_to course_path(assigns(:course))
  end

  test 'should destroy course' do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_redirected_to controller: 'backend', action: 'courses'
  end
end
