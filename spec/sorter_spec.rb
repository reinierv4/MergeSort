require_relative '../app/sorter.rb'

RSpec.describe Sorter do
  let(:sorted)   { [1,2,3,4,5,6,7,8,9,10] }
  let(:unsorted) { sorted.to_a.sort_by{ rand } }
  subject        { Sorter.new(unsorted) }

  # Antes de empezar, leete esto https://en.wikipedia.org/wiki/Sorting_algorithm

  before { expect_any_instance_of(Array).not_to receive(:sort) }

  describe ".simple" do
    it "returns a sorted list" do
      expect(subject.simple).to eq(sorted)
    end

    it "returns a sorted list" do
      expect(subject.shift_sort).to eq(sorted)
    end
  end

  describe "sorts lists" do
    pending "using merge sort" do
      expect(subject.merge_sort).to eq(sorted)
    end

    pending "using bubble sort" do
      expect(subject.bubble_sort).to eq(sorted)
    end
  end
end
