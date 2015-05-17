set -x
set -e

HEROKU_APP_NAME='prime-radar'

if [ -z "$HEROKU_APP_NAME" ]
then
    echo "\$HEROKU_APP_NAME required."
    exit 1
fi

heroku maintenance:on -a $HEROKU_APP_NAME

# よくあるシグナルを受け取ったら異常終了
trap "echo trap SIGHUP;  exit 1" HUP
trap "echo trap SIGINT;  exit 1" INT
trap "echo trap SIGQUIT; exit 1" QUIT
trap "echo trap SIGTERM; exit 1" TERM

# デプロイ
git push -f git@heroku.com:$HEROKU_APP_NAME.git

# DB Migrate
heroku run rake db:migrate -a $HEROKU_APP_NAME

heroku maintenance:off -a $HEROKU_APP_NAME
