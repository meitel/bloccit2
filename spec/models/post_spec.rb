require 'rails_helper'
# require 'RandomData'

RSpec.describe Post, type: :model do
  
   # #3
   let(:topic) { Topic.create!(name: "aaaaaa", description: "aaaaaa") }
   let(:post) { topic.posts.create!(title: "aaaaaa", body: "aaaaaa") }
 
   it { should belong_to(:topic) }

   it { should validate_presence_of(:title) }
   it { should validate_presence_of(:body) }
   it { should validate_presence_of(:topic) }
   it { should validate_length_of(:title).is_at_least(5) }
   it { should validate_length_of(:body).is_at_least(20) }
 
   describe "attributes" do
 # #2
     it "should respond to title" do
       expect(post).to respond_to(:title)
     end
 # #3
     it "should respond to body" do
       expect(post).to respond_to(:body)
     end
   end
end
