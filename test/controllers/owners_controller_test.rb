require "test_helper"

class OwnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @owner = owners(:one)
  end

  test "should get index" do
    get owners_url
    assert_response :success
  end

  test "should show owner" do
    get owner_url(@owner)
    assert_response :success
  end

  test "should create owner" do
    assert_difference("Owner.count", 1) do
      post owners_url, params: {
        owner: {
          first_name: "Pedro",
          last_name: "Lopez",
          email: "pedro@example.com",
          phone: "555555555",
          address: "Santiago"
        }
      }
    end

    assert_redirected_to owner_url(Owner.last)
    assert_equal "Owner created", flash[:notice]
  end

  test "should not create owner with invalid params" do
    assert_no_difference("Owner.count") do
      post owners_url, params: {
        owner: {
          first_name: "",
          last_name: "",
          email: "",
          phone: "",
          address: ""
        }
      }
    end

    assert_response :unprocessable_entity
  end

  test "should update owner" do
    patch owner_url(@owner), params: {
      owner: {
        first_name: "Updated",
        last_name: @owner.last_name,
        email: @owner.email,
        phone: @owner.phone,
        address: @owner.address
      }
    }

    assert_redirected_to owner_url(@owner)
    assert_equal "Owner updated", flash[:notice]
  end

  test "should destroy owner" do
    assert_difference("Owner.count", -1) do
      delete owner_url(@owner)
    end

    assert_redirected_to owners_url
    assert_equal "Owner deleted", flash[:notice]
  end
end