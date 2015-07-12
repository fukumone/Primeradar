require 'rails_helper'

describe 'PrimeNumberSearch' do
  params = { prime_form: {
    'prime_number' => 5,
    'prime_number_from' => '0', 'prime_number_to' => '100',
    'twins_prime_number_from' => '0', 'twins_prime_number_to' => '100',
    'prime_triplet_from' => '0', 'prime_triplet_to' => '100',
    'prime_quadruplet_from' => '0', 'prime_quadruplet_to' => '100',
    'number' => '100'
  } }
  prime = SearchForm.new(params)
  prime2 = SearchForm.new(prime_form: { 'prime_number' => 6 })

  example '素数判定' do
    expect(prime.prime?).to eq(true)
    expect(prime2.prime?).to eq(false)
  end

  example '素数検索' do
    expect(prime.range_prime).to eq(
      [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97])
  end

  example '双子素数検索' do
    expect(prime.twins_range_prime).to eq(
      [[3, 5], [5, 7], [11, 13], [17, 19], [29, 31], [41, 43], [59, 61], [71, 73]])
  end

  example '三つ子素数検索' do
    expect(prime.prime_triplet).to eq(
      [[5, 7, 11], [7, 11, 13], [11, 13, 17], [13, 17, 19], [17, 19, 23], [37, 41, 43], [41, 43, 47], [67, 71, 73]])
  end

  example '四つ子素数検索' do
    expect(prime.prime_quadruplet).to eq([[5, 7, 11, 13], [11, 13, 17, 19]])
  end

  example '素因数分解' do
    expect(prime.prime_factorization).to eq('2x2x5x5')
  end
end
