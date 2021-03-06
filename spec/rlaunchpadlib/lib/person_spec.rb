require_relative '../../spec_helper'

describe 'Rlaunchpadlib::Person' do
 
    before(:each) do
        @user = Rlaunchpadlib::Person.new('lazypower')
    end

    describe "GET profile" do

        before do
            VCR.insert_cassette 'person', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "returns profile data as a hash" do
            expect(@user.profile).to be_a(Hash)
        end

        it "Knows if I've signed the code of conduct" do
            expect(@user.profile['is_ubuntu_coc_signer']).to eq(true)
        end

    end

    describe "GET Person Archive Subscriptions" do

        before do
            VCR.insert_cassette 'person_archivesubscriptions', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "returns a hash of Archive Subscriptions" do
            expect(@user.archive_subscriptions).to be_a(Hash)
        end
    end

    describe "GET Person Branches" do

        before do
            VCR.insert_cassette 'person_branches', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "returns a hash of Archive Subscriptions" do
            expect(@user.branches).to be_a(Hash)
        end
    end

    describe "GET Person Bug Subscriber Packages" do

        before do
            VCR.insert_cassette 'person_bug_subscriber_packages', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "returns a hash of Archive Subscriptions" do
            expect(@user.bug_subscriber_packages).to be_a(Hash)
        end
    end

    describe "GET Person Merge Proposals" do

        before do
            VCR.insert_cassette 'person_merge_proposals', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "returns a hash of Archive Subscriptions" do
            expect(@user.merge_proposals).to be_a(Hash)
        end
    end

    describe "GET Person Requested Reviews" do

        before do
            VCR.insert_cassette 'person_requested_reviews', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "returns a hash of Archive Subscriptions" do
            expect(@user.requested_reviews).to be_a(Hash)
        end
    end

    describe "GET Person Bugs" do

        before do
            VCR.insert_cassette 'person_bugs', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "returns a hash of Archive Subscriptions" do
            expect(@user.bugs).to be_a(Hash)
        end
    end

    describe "Reset Cache" do
        it "clears all data storage attributes" do
            # warm the caches
            @user.archive_subscriptions_data = 1
            @user.requested_reviews_data = 1
            @user.merge_proposals_data = 1
            @user.bug_subscribers_data = 1
            @user.branches_data = 1
            @user.archive_subscriptions_data = 1
            # expunge the cache
            @user.clear_cache
            expect(@user.archive_subscriptions_data).to be_nil
            expect(@user.requested_reviews_data).to be_nil
            expect(@user.merge_proposals_data).to be_nil
            expect(@user.bug_subscribers_data).to be_nil
            expect(@user.branches_data).to be_nil
            expect(@user.archive_subscriptions_data).to be_nil
        end
    end


    describe "Dynamic Method Attributes" do

        it "Translates hash keys to properties" do
            expect(@user.is_ubuntu_coc_signer).to eq(true)
        end
    end

end