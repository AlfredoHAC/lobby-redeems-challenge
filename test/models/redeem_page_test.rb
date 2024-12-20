# frozen_string_literal: true

require 'test_helper'

class RedeemPageTest < ActiveSupport::TestCase
  describe 'creating a valid redeem page' do
    test 'should persist the redeem page' do
      redeem_page = build(:redeem_page)

      assert redeem_page.save
    end

    describe 'with extra questions' do
      test 'should persist the redeem page' do
        redeem_page = build(:redeem_page, :with_extra_questions)

        assert redeem_page.save
        assert_not_empty redeem_page.extra_questions
      end
    end

    describe 'with inactive status' do
      test 'should persist the redeem page' do
        redeem_page = build(:redeem_page, status: :inactive)

        assert redeem_page.save
        assert_equal 'inactive', redeem_page.status
      end
    end
  end
end
