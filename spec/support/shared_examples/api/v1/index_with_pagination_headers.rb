RSpec.shared_examples 'api v1 index with pagination headers' do
  it { expect(response.headers['Per-Page']).to be_present }
  it { expect(response.headers['Total']).to be_present }
end
