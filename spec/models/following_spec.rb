require 'rails_helper'

RSpec.describe Following, type: :model do

  it { should belong_to(:follower) }
  it { should belong_to(:followed) }

end