require 'spec_helper'
include PrimeSpecHelper

describe 'PrimeNumberSearch' do

  array_prime = prime_number_range_search(1000)
  array_prime.each_with_index do |times, int|
    let("prime_number_#{int + 1}") { create(:prime_numbers, prime_number: times) }
  end

  context '素数範囲検索' do
    p "aaaaaaa"
    aa = PrimeNumber.search_range_prime("1", "1000")
    p aa.count
  end

  context '双子素数範囲検索' do
    p "bbbbbbb"
    bb = PrimeNumber.search_twins_range_prime("1", "1111")
    p bb.count
  end

  context '三つ子素数検索' do
  end

  context '四つ子素数検索' do
  end
end
