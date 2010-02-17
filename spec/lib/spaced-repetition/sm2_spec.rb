require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')

describe SuperMemo::SM2 do
  
  describe 'mixin' do
    
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
      lambda {
        nil.extend SuperMemo::SM2
      }.should raise_error(DBC)
      
    end
    
    it 'should initialize values' do
      @flash_card.easiness_factor.should == 2.5  
      @flash_card.number_repetitions.should == 0  
      @flash_card.repetition_interval.should == nil  
      @flash_card.quality_of_last_recall.should == nil  
      @flash_card.next_repetition.should == Date.today  
    end
    
    it 'should schedule next repetition for tomorrow if repetition_interval = 0 and quality_of_last_recall = 4' do
      @flash_card.process_recall_result(4)
      
      @flash_card.number_repetitions.should == 1
      @flash_card.repetition_interval.should == 1
      @flash_card.next_repetition.should == (Date.today + 1)
      @flash_card.easiness_factor.should == 2.5
    end
    
  end


end