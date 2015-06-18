require 'test_helper'

class MeetingHasMembersControllerTest < ActionController::TestCase
  setup do
    @meeting_has_member = meeting_has_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meeting_has_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meeting_has_member" do
    assert_difference('MeetingHasMember.count') do
      post :create, meeting_has_member: { meeting_id: @meeting_has_member.meeting_id, member_id: @meeting_has_member.member_id }
    end

    assert_redirected_to meeting_has_member_path(assigns(:meeting_has_member))
  end

  test "should show meeting_has_member" do
    get :show, id: @meeting_has_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meeting_has_member
    assert_response :success
  end

  test "should update meeting_has_member" do
    patch :update, id: @meeting_has_member, meeting_has_member: { meeting_id: @meeting_has_member.meeting_id, member_id: @meeting_has_member.member_id }
    assert_redirected_to meeting_has_member_path(assigns(:meeting_has_member))
  end

  test "should destroy meeting_has_member" do
    assert_difference('MeetingHasMember.count', -1) do
      delete :destroy, id: @meeting_has_member
    end

    assert_redirected_to meeting_has_members_path
  end
end
