require 'rails_helper'

describe 'Projects V1 API' do
  let(:project) { create :project }

  describe 'GET /api/v1/projects' do
    let!(:projects) { create_list :project, 2 }
    before { get '/api/v1/projects' }

    let(:expected) do
      projects
        .map { |project| API::V1::Entities::Project.new(project).as_json }
        .as_json
    end

    it 'retrieves projects' do
      expect(json).to match expected
    end

    include_examples 'api v1 index with pagination headers'
  end

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
