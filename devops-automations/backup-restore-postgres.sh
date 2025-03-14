#!/bin/bash
pg_dump -U postgres -d mydatabase -F c -f /backup/db_backup_$(date+%F).dump

pg_restore -U postgres -d mydatabase -c /backup/db_backup_YYYY-MM-DD.dump