require 'spec_helper'

describe 'Translator' do
  let(:t) { Translator.new }

  describe 'counts one to ten' do
    it { t.eng(1).must_equal 'one' }
    it { t.eng(5).must_equal 'five' }
    it { t.eng(10).must_equal 'ten' }
  end

  describe '11 to 19' do
    it { t.eng(12).must_equal 'twelve' }
    it { t.eng(15).must_equal 'fifteen' }
    it { t.eng(17).must_equal 'seventeen' }
    it { t.eng(18).must_equal 'eighteen' }
  end

  describe 'multiples of 10 up to 90' do
    it { t.eng(20).must_equal 'twenty' }
    it { t.eng(30).must_equal 'thirty' }
    it { t.eng(50).must_equal 'fifty' }
    it { t.eng(80).must_equal 'eighty' }
  end

  describe '21 to 29' do
    it { t.eng(21).must_equal 'twenty one' }
    it { t.eng(42).must_equal 'forty two' }
    it { t.eng(77).must_equal 'seventy seven' }
  end

  describe 'multiples of 100' do
    it { t.eng(100).must_equal 'one hundred' }
    it { t.eng(600).must_equal 'six hundred' }
  end

  describe 'hundredsy' do
    it { t.eng(601).must_equal 'six hundred and one' }
    it { t.eng(342).must_equal 'three hundred and forty two' }
    it { t.eng(115).must_equal 'one hundred and fifteen' }
  end

  describe 'count' do
    it { t.count(115).must_equal 20 }
    it { t.count(342).must_equal 23 }
    it { t.count(1..5).must_equal 19 }
    it { t.count(1..999).must_equal 21124 - 11 }
  end
end
