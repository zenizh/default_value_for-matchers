require 'spec_helper'

describe User, type: :model do
  it { is_expected.to have_default_value_for(:name) }
  it { is_expected.to have_default_value_for(:name).with_value('no name') }
  it { is_expected.to have_default_value_for(:name).with_value('no name').and_allow_nil }

  it { is_expected.to have_default_value_for(:age) }
  it { is_expected.to have_default_value_for(:age).with_value(20) }
  it { is_expected.to have_default_value_for(:age).with_value(20).and_disallow_nil }
end
