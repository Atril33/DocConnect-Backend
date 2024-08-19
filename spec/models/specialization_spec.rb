require 'rails_helper'

RSpec.describe Specialization, type: :model do
  it 'validates that name is necessary' do
    specialization = Specialization.new(name: nil)
    expect(specialization).to_not be_valid
  end
end
