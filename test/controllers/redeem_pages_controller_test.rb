# test/controllers/products_controller_test.rb
require 'test_helper'

def parse_response_body(response_body)
  JSON.parse(response_body).with_indifferent_access
end

class RedeemPagesControllerTest < ActionDispatch::IntegrationTest
  describe 'GET /api/v1/redeem_pages/:id' do
    setup do
      @redeem_page = create(:redeem_page)
    end
    test 'should get redeem page data' do
      get api_v1_redeem_page_url(@redeem_page)

      assert_response :ok
      assert_equal @redeem_page.id, parse_response_body(response.body)[:id]
    end

    describe 'with sized products' do
      setup do
        sized_items = build_list(:item, 2, :sized)
        @redeem_page = create(:redeem_page, items: sized_items)
      end

      test 'should get redeem page data' do
        get api_v1_redeem_page_url(@redeem_page)

        assert_response :ok
        assert_equal @redeem_page.id, parse_response_body(response.body)[:id]
        assert_not_empty parse_response_body(response.body)[:items].pluck(:sizes).flatten
      end
    end

    describe 'with extra questions' do
      setup do
        @redeem_page = create(:redeem_page, :with_extra_questions)
      end
      test 'should get redeem page data' do
        get api_v1_redeem_page_url(@redeem_page)

        assert_response :ok
        assert_equal @redeem_page.id, parse_response_body(response.body)[:id]
        assert_not_empty parse_response_body(response.body)[:extra_questions]
      end
    end

    describe 'inactive redeem page' do
      setup do
        @redeem_page = create(:redeem_page, status: :inactive)
      end

      test 'should ommit redeem page data' do
        get api_v1_redeem_page_url(@redeem_page)
        assert_response :forbidden
      end
    end
  end
end
