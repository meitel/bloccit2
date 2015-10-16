 require 'rails_helper'
 
 RSpec.describe Labeling, type: :model do
 # #1
   it { should belong_to :labelable }
 end

 require 'rails_helper'
 
 RSpec.describe Label, type: :model do
 # #4
   it { should belong_to :labelable }
 end