# == Schema Information
#
# Table name: announcements
#
#  id                  :integer          not null, primary key
#  title               :string
#  content             :text
#  attachments_count   :integer
#  limit_to_users      :text
#  start_delivering_at :datetime
#  stop_delivering_at  :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe AnnouncementsController, type: :controller do
  login_user
  # This should return the minimal set of attributes required to create a valid
  # Announcement. As you add validations to Announcement, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { content: 'hi', title: 'title' }
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AnnouncementsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all announcements as @announcements' do
      announcement = Announcement.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:announcements)).to eq([announcement])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested announcement as @announcement' do
      announcement = Announcement.create! valid_attributes
      get :show, { id: announcement.to_param }, valid_session
      expect(assigns(:announcement)).to eq(announcement)
    end
  end

  describe 'GET #new' do
    it 'assigns a new announcement as @announcement' do
      get :new, {}, valid_session
      expect(assigns(:announcement)).to be_a_new(Announcement)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested announcement as @announcement' do
      announcement = Announcement.create! valid_attributes
      get :edit, { id: announcement.to_param }, valid_session
      expect(assigns(:announcement)).to eq(announcement)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Announcement' do
        expect do
          post :create, { announcement: valid_attributes }, valid_session
        end.to change(Announcement, :count).by(1)
      end

      it 'assigns a newly created announcement as @announcement' do
        post :create, { announcement: valid_attributes }, valid_session
        expect(assigns(:announcement)).to be_a(Announcement)
        expect(assigns(:announcement)).to be_persisted
      end

      it 'redirects to the created announcement' do
        post :create, { announcement: valid_attributes }, valid_session
        expect(response).to redirect_to(Announcement.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved announcement as @announcement' do
        post :create, { announcement: invalid_attributes }, valid_session
        expect(assigns(:announcement)).to be_a_new(Announcement)
      end

      it "re-renders the 'new' template" do
        post :create, { announcement: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested announcement' do
        announcement = Announcement.create! valid_attributes
        put :update, { id: announcement.to_param, announcement: new_attributes }, valid_session
        announcement.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested announcement as @announcement' do
        announcement = Announcement.create! valid_attributes
        put :update, { id: announcement.to_param, announcement: valid_attributes }, valid_session
        expect(assigns(:announcement)).to eq(announcement)
      end

      it 'redirects to the announcement' do
        announcement = Announcement.create! valid_attributes
        put :update, { id: announcement.to_param, announcement: valid_attributes }, valid_session
        expect(response).to redirect_to(announcement)
      end
    end

    context 'with invalid params' do
      it 'assigns the announcement as @announcement' do
        announcement = Announcement.create! valid_attributes
        put :update, { id: announcement.to_param, announcement: invalid_attributes }, valid_session
        expect(assigns(:announcement)).to eq(announcement)
      end

      it "re-renders the 'edit' template" do
        announcement = Announcement.create! valid_attributes
        put :update, { id: announcement.to_param, announcement: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested announcement' do
      announcement = Announcement.create! valid_attributes
      expect do
        delete :destroy, { id: announcement.to_param }, valid_session
      end.to change(Announcement, :count).by(-1)
    end

    it 'redirects to the announcements list' do
      announcement = Announcement.create! valid_attributes
      delete :destroy, { id: announcement.to_param }, valid_session
      expect(response).to redirect_to(announcements_url)
    end
  end
end
