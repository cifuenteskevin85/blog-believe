require 'spec_helper'

describe Post, "Relations" do
  it { should belong_to(:user) }
end

describe Post, "Validate" do
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:body)}
  it {should validate_presence_of(:publish_date)}
  it {should validate_presence_of(:user_id)}
end
