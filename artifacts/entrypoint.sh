#!/bin/bash

echo "Create Environmnet File /etc/environment"
env | grep -v -E '^(no_proxy|PATH|HOME|USER|GROUP|UID|GID|SHELL|affinitiy)' | sed -r 's/^/export /' > /etc/environment
chmod 0644 /etc/environment


[[ -d /logs ]] && chmod 0777 /logs

echo "Runnning Files in /docker-entrypoint.d"
for f in /docker-entrypoint.d/*; do
	[[ -f $f ]] || continue
    case "$f" in
        *.sh)  echo "$0: running $f"; . "$f" ;;
		*)     echo "$0: ignoring $f" ;;
    esac
    echo
done

echo "Adapting User"
. /adapt_user.sh

exec "$@"
