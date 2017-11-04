require 'rails_helper'

describe 'Projects V1 API' do
  let(:project) { create :project }

  describe 'GET /api/v1/projects/:id' do
    context 'when found a resource' do
      let(:expected) { API::V1::Entities::Project.new(project).as_json }

      it 'retrieves a specific project' do
        get "/api/v1/projects/#{project.id}"

        expect(response).to be_success

        expect(json.symbolize_keys).to eq expected
      end
    end

    context 'when does not found a resource' do
      it 'returns 404' do
        get '/api/v1/projects/-1'

        expect(response).to be_not_found
      end
    end
  end
end
