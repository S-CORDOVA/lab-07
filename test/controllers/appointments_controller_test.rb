require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment = appointments(:one)
    @pet = pets(:one)
    @vet = vets(:one)
  end

  test "should get index" do
    get appointments_url
    assert_response :success
  end

  test "should show appointment" do
    get appointment_url(@appointment)
    assert_response :success
  end

  test "should create appointment" do
    assert_difference("Appointment.count", 1) do
      post appointments_url, params: {
        appointment: {
          pet_id: @pet.id,
          vet_id: @vet.id,
          date: "2026-06-01 10:00:00",
          reason: "New checkup",
          status: "scheduled"
        }
      }
    end

    assert_redirected_to appointment_url(Appointment.last)
    assert_equal "Appointment created", flash[:notice]
  end

  test "should not create appointment with invalid params" do
    assert_no_difference("Appointment.count") do
      post appointments_url, params: {
        appointment: {
          pet_id: nil,
          vet_id: nil,
          date: "",
          reason: "",
          status: ""
        }
      }
    end

    assert_response :unprocessable_entity
  end

  test "should update appointment" do
    patch appointment_url(@appointment), params: {
      appointment: {
        pet_id: @appointment.pet_id,
        vet_id: @appointment.vet_id,
        date: @appointment.date,
        reason: "Updated reason",
        status: @appointment.status
      }
    }

    assert_redirected_to appointment_url(@appointment)
    assert_equal "Appointment updated", flash[:notice]
  end

  test "should destroy appointment" do
    assert_difference("Appointment.count", -1) do
      delete appointment_url(@appointment)
    end

    assert_redirected_to appointments_url
    assert_equal "Appointment deleted", flash[:notice]
  end
end