require 'spec_helper'

describe Event do

  # describe 'name' do
  #   it 'should not be blank' do
  #     event = Event.new name: nil
  #     expect(event).to have(1).error_on(:name)
  #   end

  #   it 'should not have error when present' do
  #     event = Event.new name: "hi"
  #     expect(event).not_to have(1).error_on(:name)
  #   end

  #   it 'should not be longer than 60 characters' do
  #     event = Event.new name: "a"*61
  #     expect(event).to have(1).error_on(:name)
  #   end
  # end

  describe 'description' do

    it 'is valid when blank' do
      event = Event.new description: ""
      expect(event).to have(0).error_on(:description)
    end

    it 'is not valid when it has less than 100 characters' do
      event = Event.new description: "a"*99
      expect(event).to have(1).error_on(:description)
    end

    it 'is valid when it has 100 characters' do
      event = Event.new description: "a"*100
      expect(event).to have(0).error_on(:description)
    end

  end

  describe 'start_at' do

    it 'is invalid when blank' do
      event = Event.new start_at: nil
      expect(event).to have(1).error_on(:start_at)
    end

  end

  describe 'for_today' do

    it 'returns an event that starts today' do
      event = FactoryGirl.create(:event, start_at: Time.now)
      expect(Event.for_today).to include(event)
    end

    it 'does not return an event that starts tomorrow' do
      event = FactoryGirl.create(:event, start_at: 1.day.from_now)
      expect(Event.for_today).to be_empty
      # expect(Event.for_today).not_to include(event)

      # expect(Event.for_today).to eq([])
      # expect(Event.for_today).not_to exist
      # expect(Event.for_today.count).to eq(0)
      # expect(Event.for_today.count).to be_zero
    end

    it 'does not return an event that has started' do
      event = FactoryGirl.create(:event, start_at: 1.day.ago)
      expect(Event.for_today).to be_empty
    end

  end

  describe 'user' do

    it 'is mandatory' do
      event = Event.new user: nil
      expect(event).to have(1).error_on(:user)
    end

  end




end
