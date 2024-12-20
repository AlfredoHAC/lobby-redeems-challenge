# test/controllers/products_controller_test.rb
require 'test_helper'

class RedeemsControllerTest < ActionDispatch::IntegrationTest
  describe 'POST /api/v1/redeems' do
    setup do
      @redeem_page = create(:redeem_page)
      @params = { 'redeem' => build(:redeem, redeem_page: @redeem_page)
                .attributes
                .except(
                  'id',
                  'created_at',
                  'updated_at'
                ) }
    end

    test 'should create redeem associated with redeem page' do
      post api_v1_redeems_url, params: @params

      assert_response :created
      assert_not_nil JSON.parse(response.body)['redeem_page']
    end

    test 'returns created redeem data' do
      post api_v1_redeems_url, params: @params
      assert_response :created
    end

    describe 'consecutive redeems' do
      setup do
        create(:redeem, @params['redeem'])
      end
      test 'does not allow redeem creation' do
        post api_v1_redeems_url, params: @params
        assert_response :unprocessable_entity
      end
    end
  end
end
