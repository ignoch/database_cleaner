require 'spec_helper'
require 'database_cleaner/mongo_mapper/base'
require 'database_cleaner/shared_strategy'

module DatabaseCleaner
  describe MongoMapper do
    it { should respond_to(:available_strategies) }
  end

  module MongoMapper
    class ExampleStrategy
      include ::DatabaseCleaner::MongoMapper::Base
    end

    describe ExampleStrategy do

      it_should_behave_like "a generic strategy"

      describe "db" do
        it { should respond_to(:db=) }

        it "should store my desired db" do
          subject.db = :my_db
          subject.db.should eq :my_db
        end

        it "should default to :default" do
          subject.db.should eq :default
        end
      end
    end
  end
end
