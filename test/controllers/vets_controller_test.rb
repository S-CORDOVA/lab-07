require "test_helper"

class VetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vet = vets(:one)
  end

  test "should get index" do
    get vets_url
    assert_response :success
  end

  test "should show vet" do
    get vet_url(@vet)
    assert_response :success
  end

  test "should create vet" do
    assert_difference("Vet.count", 1) do
      post vets_url, params: {
        vet: {
          first_name: "Laura",
          last_name: "Gomez",
          email: "laura@example.com",
          phone: "555555555",
          specialization: "Dermatology"
        }
      }
    end

    assert_redirected_to vet_url(Vet.last)
    assert_equal "Vet created", flash[:notice]
  end

  test "should not create vet with invalid params" do
    assert_no_difference("Vet.count") do
      post vets_url, params: {
        vet: {
          first_name: "",
          last_name: "",
          email: "",
          phone: "",
          specialization: ""
        }
      }
    end

    assert_response :unprocessable_entity
  end

  test "should update vet" do
    patch vet_url(@vet), params: {
      vet: {
        first_name: "Updated",
        last_name: @vet.last_name,
        email: @vet.email,
        phone: @vet.phone,
        specialization: @vet.specialization
      }
    }

    assert_redirected_to vet_url(@vet)
    assert_equal "Vet updated", flash[:notice]
  end

  test "should destroy vet" do
    assert_difference("Vet.count", -1) do
      delete vet_url(@vet)
    end

    assert_redirected_to vets_url
    assert_equal "Vet deleted", flash[:notice]
  end
end