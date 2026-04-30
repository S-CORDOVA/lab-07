require "test_helper"

class TreatmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment = appointments(:one)
    @treatment = treatments(:one)
  end

  test "should get new" do
    get new_appointment_treatment_url(@appointment)
    assert_response :success
  end

  test "should get edit" do
    get edit_appointment_treatment_url(@appointment, @treatment)
    assert_response :success
  end

  test "should create treatment" do
    assert_difference("Treatment.count", 1) do
      post appointment_treatments_url(@appointment), params: {
        treatment: {
          name: "Antibiotic",
          medication: "Amoxicillin",
          dosage: "5 ml",
          notes: "After food",
          administered_at: "2026-06-01 10:30:00"
        }
      }
    end

    assert_redirected_to appointment_url(@appointment)
    assert_equal "Treatment created", flash[:notice]
  end

  test "should not create treatment with invalid params" do
    assert_no_difference("Treatment.count") do
      post appointment_treatments_url(@appointment), params: {
        treatment: {
          name: "",
          medication: "",
          dosage: "",
          notes: "",
          administered_at: ""
        }
      }
    end

    assert_response :unprocessable_entity
  end

  test "should update treatment" do
    patch appointment_treatment_url(@appointment, @treatment), params: {
      treatment: {
        name: "Updated treatment",
        medication: @treatment.medication,
        dosage: @treatment.dosage,
        notes: @treatment.notes,
        administered_at: @treatment.administered_at
      }
    }

    assert_redirected_to appointment_url(@appointment)
    assert_equal "Treatment updated", flash[:notice]
  end

  test "should destroy treatment" do
    assert_difference("Treatment.count", -1) do
      delete appointment_treatment_url(@appointment, @treatment)
    end

    assert_redirected_to appointment_url(@appointment)
    assert_equal "Treatment deleted", flash[:notice]
  end
end