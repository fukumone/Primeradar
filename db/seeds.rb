require 'Prime'
# Prime.each(10 ** 6) do |prime|
#   PrimeNumber.create(
#     prime_number: prime
#   )
# end
# 2分５８秒(sqlite3)
# 1分31秒(mysql2)

# 10 ** 15(1000兆)個の素数を作る
# 現時点でそれほどの数を検索できるサイトはない。
# スクリプトにイテレータで書いてフォームを送って回すと時間がかかりすぎる。
# データベースを作ってそこから検索できるようにした方が早く、ページネーションを使えばさらに早く検索できる。
# sqlite3かmysql2のどちらかにするか検討中である。

Prime.each_with_index(10 ** 6) do |prime, index|
  ActiveRecord::Base.connection.execute("Insert INTO prime_numbers (id, prime_number) VALUES
      (  #{index + 1}, #{prime} );")
end
# 1分３２秒(sqlite3)
# 34秒(mysql2)

# Prime.each_with_index(10 ** 6) do |prime, index|
#   PrimeNumber.find_by_sql("Insert INTO prime_numbers (id, prime_number) VALUES
#   ( #{index + 1}, #{prime} );")
# end
# 1分３１秒
