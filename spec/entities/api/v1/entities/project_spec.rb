require 'rails_helper'

describe API::V1::Entities::Project do
  describe '#serializable_hash' do
    subject { described_class.new(project).serializable_hash }

    let(:project) { build_stubbed :project }
    let(:expected) do
      {
        name: project.name,
        id: project.id,
        created_at: project.created_at.to_s(:iso8601),
        updated_at: project.updated_at.to_s(:iso8601)
      }
    end

    it { is_expected.to match expected }
  end
end
