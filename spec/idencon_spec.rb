# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Idencon do
  describe '.generate' do
    it 'success generating file' do
      expect_any_instance_of(ChunkyPNG::Image).to receive(:save).and_return true
      identicon = Idencon::Identicon.new('test_user', "#{__dir__}/tmp/")
      expect(identicon.generate).to be true
    end

    context 'generating file with error' do
      it 'with empty user_name' do
        identicon = Idencon::Identicon.new('', "#{__dir__}/tmp/")
        expect { identicon.generate }.to raise_error 'User_name cannot be nil'
      end

      it 'with nil user_name' do
        identicon = Idencon::Identicon.new(nil, "#{__dir__}/tmp/")
        expect { identicon.generate }.to raise_error 'User_name cannot be nil'
      end
    end
  end
end
