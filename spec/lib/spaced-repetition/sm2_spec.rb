require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')

describe SuperMemo::SM2 do
  
  describe 'include mixin' do

    it 'should work fine when including' do
      class Temp
        attr_accessor :easiness_factor, :number_repetitions, :quality_of_last_recall, :next_repetition, :repetition_interval
        include SuperMemo::SM2
      end
      
      t = Temp.new
      t.check_spaced_repetition_methods
    end

    it 'should raise DBC exception if class including is missing fields' do
      class Temp2 
        include SuperMemo::SM2
      end
      t = Temp2.new

      lambda {
        t.check_spaced_repetition_methods
      }.should raise_error(DBC::AssertconditionException)
    end

  end
  
  describe 'exclude mixin' do
    
    before :each do
      @flash_card = {
        :easiness_factor => nil, 
        :number_repetitions => nil, 
        :quality_of_last_recall => nil,
        :next_repetition => nil,
        :repetition_interval => nil,
        :question => "Who is the most awesome of them all?",
        :answer => 'Me!'
      }.ostructify

      @flash_card.extend SuperMemo::SM2
      @flash_card.reset_spaced_repetition_data
    end
    
    it 'should raise DBC exception if class extended is missing fields' do
      lambda { nil.extend SuperMemo::SM2 }.should raise_error(DBC::AssertconditionException)
    end
    
    it 'should initialize values' do
      @flash_card.easiness_factor.should == 2.5  
      @flash_card.number_repetitions.should == 0  
      @flash_card.repetition_interval.should == nil  
      @flash_card.quality_of_last_recall.should == nil  
      @flash_card.next_repetition.should == nil
    end
    
    it 'should schedule next repetition for tomorrow if repetition_interval = 0 and quality_of_last_recall = 4' do
      @flash_card.process_recall_result(4)
      
      @flash_card.number_repetitions.should == 1
      @flash_card.repetition_interval.should == 1
      @flash_card.next_repetition.should == (Date.today + 1)
      @flash_card.easiness_factor.should be_close(2.5, 0.01)
    end

    it 'should schedule next repetition for 6 days if repetition_interval = 1 and quality_of_last_recall = 4' do
      @flash_card.process_recall_result(4)
      @flash_card.process_recall_result(4)
      
      @flash_card.number_repetitions.should == 2
      @flash_card.repetition_interval.should == 6
      @flash_card.next_repetition.should == (Date.today + 6)
      @flash_card.easiness_factor.should be_close(2.5, 0.01)
    end
    
    it 'should report as scheduled to recall (for today)' do
      @flash_card.next_repetition = Date.today
      @flash_card.scheduled_to_recall?.should == true

      @flash_card.next_repetition = Date.today - 1
      @flash_card.scheduled_to_recall?.should == true
    end
    
    it 'should not be scheduled to recall' do
      @flash_card.next_repetition = nil
      @flash_card.scheduled_to_recall?.should == false

      @flash_card.next_repetition = Date.today + 1
      @flash_card.scheduled_to_recall?.should == false

      @flash_card.next_repetition = Date.today + 99
      @flash_card.scheduled_to_recall?.should == false
    end
    
  end


end