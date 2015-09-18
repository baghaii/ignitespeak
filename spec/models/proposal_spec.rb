# == Schema Information
#
# Table name: proposals
#
#  id             :integer          not null, primary key
#  speaker_name   :string(255)      not null
#  title          :string(255)      not null
#  description    :text             not null
#  email          :string(255)      not null
#  phone          :string(255)
#  bio            :text             not null
#  website        :string(255)
#  hash_code      :string(255)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  selected       :boolean          default(FALSE), not null
#  position       :integer          default(0), not null
#  filepicker_url :string(255)
#  archived       :boolean          default(FALSE), not null
#

RSpec.describe Proposal do
  it { should validate_length_of(:speaker_name).is_at_most(254) }
  it { should validate_length_of(:title).is_at_most(254) }
  it { should validate_length_of(:email).is_at_most(254) }
  it { should validate_length_of(:phone).is_at_most(254) }
  it { should validate_length_of(:website).is_at_most(254) }
  it { should validate_length_of(:description).is_at_most(1000) }
  it { should validate_length_of(:bio).is_at_most(100) }

#website validation
  it { should allow_value('').for(:website) }
  it { should allow_value('http://foo.com').for(:website) }
  it { should allow_value('https://foo.com').for(:website) }
  it { should allow_value('Http://www.foo.com').for(:website) }
  it { should allow_value('HTTP://WWW.FOO.COM').for(:website) }
  it { should_not allow_value('www.foo.com').for(:website) }
  it { should_not allow_value('httpsss://www.foo.com').for(:website) } 

end
