require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do

  it { should route(:post, 'api/session').to(action: :create)  }

  it { should route(:delete, 'api/session').to(action: :destroy) }

  describe '#create.json' do
    before { expect(subject).to receive(:build_resource) }

    before do
      expect(subject).to receive(:resource) do
        double.tap { |a| expect(a).to receive(:save!) }
      end
    end

    before { post :create, session: { email: 'one@digits.com', password: '12345678' }, format: :json }

    it { should render_template :create }
  end

  describe '#destroy.json' do
    let(:user) { stub_model User }

    before { sign_in user }

    before do
      expect(subject).to receive(:resource) do
        double.tap { |a| expect(a).to receive(:destroy!) }
      end
    end

    before { delete :destroy, format: :json }

    it { expect(response.status).to eq(200) }
  end
end
