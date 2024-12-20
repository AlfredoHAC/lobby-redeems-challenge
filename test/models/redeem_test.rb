require 'test_helper'

class RedeemTest < ActiveSupport::TestCase
  describe 'creating a valid redeem' do
    setup do
      @redeem_page = create(:redeem_page)
    end
    test 'should persist the redeem' do
      redeem = build(:redeem, redeem_page: @redeem_page)

      assert redeem.save
    end
  end

  describe 'trying to create a new redeem with same data' do
    describe 'when another with pending evaluation status exists' do
      setup do
        @redeem_page = create(:redeem_page)
        @existing_redeem_params = create(:redeem, redeem_page: @redeem_page)
                                  .attributes
                                  .except(
                                    'id',
                                    'created_at',
                                    'updated_at'
                                  )
      end
      test 'should not persist the redeem' do
        redeem = build(:redeem, @existing_redeem_params)

        assert_not redeem.save
        assert_not_empty redeem.errors.messages
      end
    end

    describe 'when another with not-pending evaluation status exists' do
      setup do
        @redeem_page = create(:redeem_page)
        @existing_redeem_params = create(:redeem, status: :approved, redeem_page: @redeem_page)
                                  .attributes
                                  .except(
                                    'id',
                                    'status',
                                    'created_at',
                                    'updated_at'
                                  )
                                  .merge('status' => 'pending')
      end
      test 'should not persist the redeem' do
        redeem = build(:redeem, @existing_redeem_params)

        assert redeem.save
        assert_empty redeem.errors.messages
      end
    end
  end
end
