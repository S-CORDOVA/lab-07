require "test_helper"

class PetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet = pets(:one)
    @owner = owners(:one)
  end

  test "should get index" do
    get pets_url
    assert_response :success
  end

  test "should show pet" do
    get pet_url(@pet)
    assert_response :success
  end

  test "should create pet" do
    assert_difference("Pet.count", 1) do
      post pets_url, params: {
        pet: {
          name: "Rocky",
          species: "dog",
          breed: "Bulldog",
          date_of_birth: "2022-03-03",
          weight: 10.5,
          owner_id: @owner.id
        }
      }
    end

    assert_redirected_to pet_url(Pet.last)
    assert_equal "Pet created", flash[:notice]
  end

  test "should not create pet with invalid params" do
    assert_no_difference("Pet.count") do
      post pets_url, params: {
        pet: {
          name: "",
          species: "",
          breed: "",
          date_of_birth: "",
          weight: "",
          owner_id: nil
        }
      }
    end

    assert_response :unprocessable_entity
  end

  test "should update pet" do
    patch pet_url(@pet), params: {
      pet: {
        name: "Updated",
        species: @pet.species,
        breed: @pet.breed,
        date_of_birth: @pet.date_of_birth,
        weight: @pet.weight,
        owner_id: @pet.owner_id
      }
    }

    assert_redirected_to pet_url(@pet)
    assert_equal "Pet updated", flash[:notice]
  end

  test "should destroy pet" do
    assert_difference("Pet.count", -1) do
      delete pet_url(@pet)
    end

    assert_redirected_to pets_url
    assert_equal "Pet deleted", flash[:notice]
  end
end