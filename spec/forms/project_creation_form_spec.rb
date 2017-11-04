require 'rails_helper'

describe ProjectCreationForm do
  let(:form) { described_class.new Project.new }

  it 'requires name' do
    expect(form.validate({})).to be false

    expect(form.errors[:name]).to match ['must be filled']
  end

  it 'requires unique name' do
    create :project, name: 'Area 51'

    form.validate(name: 'Area 51')

    expect(form.errors[:name]).to match ['has already been taken']
  end

  let(:valid_params) { attributes_for :project }

  it 'successfully validate the form' do
    expect(form.validate(valid_params)).to be true

    expect(form.save).to be true
  end
end
