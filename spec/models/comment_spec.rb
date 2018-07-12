require 'rails_helper'

describe Comment do
  describe 'valitdations' do
    it {should validate_presence_of(:author)}
    it {should validate_presence_of(:body)}
  end
  describe 'relationships' do
    it {should belong_to(:article)}
  end
end
