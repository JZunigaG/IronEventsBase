require 'spec_helper'

describe EventsController do

  describe '#index' do

    # it 'displays events for today' do
    #   event = double("event")

    #   expect(Event).to receive(:send_message)

    #   expect(Event).to receive(:for_today).and_return([event])

    #   expect(Event).to receive(:for_today).and_call_original


    #   get :index

    #   #expect(assigns(:events)).to eq([event])
    # end

    # it 'displays events for today' do
    #   event = double("event")

    #   Event.stub(:for_today).and_return([event])

    #   get :index

    #   expect(assigns(:events)).to eq([event])
    # end

    it 'displays events for today' do
      event = FactoryGirl.create(:event, start_at: Time.now)

      expect(Event).to receive(:for_today).and_call_original

      get :index

      expect(assigns(:events)).to eq([event])
    end

  end

  describe '#create' do

    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    it 'creates an event' do
      # attrs = {
      #   name: 'prueba',
      #   description: 'prueba'*50,
      #   start_at: 1.day.from_now,
      #   end_at: 3.days.from_now
      # }

      attrs = FactoryGirl.attributes_for(:event)

      # attrs = FactoryGirl.build(:event).attributes

      expect {
        post :create, event: attrs
      }.to change(Event, :count)

     expect(response).to redirect_to(assigns(:event))
    end

    it 'renders the form when invalid' do
      post :create, event: { name: 'hola' }

      expect(response).to render_template(:new)
    end

  end

end
