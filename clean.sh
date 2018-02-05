git filter-branch --env-filter '
OLD_EMAIL="invalid-email-address"
CORRECT_NAME="Caibiy"
CORRECT_EMAIL="caibiy666@gmail.com"
if [ "$GIT_COMMITTER_NAME" = "invalid-email-address" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_NAME" = "invalid-email-address" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
