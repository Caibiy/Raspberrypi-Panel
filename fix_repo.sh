git filter-branch --env-filter '

am="$GIT_AUTHOR_EMAIL"
cm="$GIT_COMMITTER_EMAIL"

if [ "$GIT_COMMITTER_EMAIL" = "invalid-email-address" ]
then
    cm="caibiy666@gmail.com"
fi
if [ "$GIT_AUTHOR_EMAIL" = "invalid-email-address" ]
then
    am="caibiy666@gmail.com"
fi

export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_EMAIL="$cm"
'
