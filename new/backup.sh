ssh $DB_NAME "su - $DB_NAME -c 'pg_dump $DB_NAME --no-owner' | gzip -c" | zcat | psql $DB_NAME
