require './prime.rb'

# require 'parallel'

# Prime.each(10 ** 6) do |prime|
#   PrimeNumber.create(
#     prime_number: prime
#   )
# end
# 2分５８秒(sqlite3)
# 1分31秒(mysql2)
# バルクインサートしたら65.42 real

# 10 ** 15(1000兆)個の素数を作る
# 現時点でそれほどの数を検索できるサイトはない。
# スクリプトにイテレータで書いてフォームを送って回すと時間がかかりすぎる。
# データベースを作ってそこから検索できるようにした方が早く、ページネーションを使えばさらに早く検索できる。
# sqlite3かmysql2のどちらかにするか検討中である。

# Prime.each_with_index(10 ** 6) do |prime, index|
#   ActiveRecord::Base.connection.execute("Insert INTO prime_numbers (id, prime_number) VALUES
#       (  #{index + 1}, #{prime} );")
# end
# 1分３２秒(sqlite3)
# 34秒(mysql2)

# primes = Prime.each_with_index(10 ** 6)

# Parallel.each(primes, :in_processes => 10 ) do |prime, index|
#   ActiveRecord::Base.connection.execute("INSERT INTO prime_numbers (id, prime_number) VALUES
#       (  #{index + 1}, #{prime} );")
# end

# primes = Prime.each_with_index(10 ** 6)

# Parallel.each(primes, :in_processes => 10 ) do |prime, index|
#   ActiveRecord::Base.connection.execute("INSERT INTO prime_numbers VALUES ( #{index + 1}, #{prime} );")
# end

#並列化 25秒(スレッド３) :in_threads => 3
#並列化 23秒(スレッド３) :in_processes => 5
#並列化 21秒(スレッド３) :in_processes => 10

# Prime.each_with_index(10 ** 6) do |prime, index|
#   PrimeNumber.find_by_sql("Insert INTO prime_numbers (id, prime_number) VALUES
#   ( #{index + 1}, #{prime} );")
# end
# 1分３１秒

# bundle exec time spring rake db:reset

# arr_prime = []
# numbers =  Prime.each(10 ** 6)

# Parallel.each(numbers, :in_processes => 10 ) do |prime|
#   arr_prime << PrimeNumber.new(:prime_number => prime)
# end

# PrimeNumber.import arr_prime

arr_prime = []
Prime.each(10 ** 6) do |prime|
  arr_prime << PrimeNumber.new(:prime_number => prime)
end

PrimeNumber.import arr_prime
