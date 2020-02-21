echo off
sqlcmd -E -S (local)  -d MASTER -i backup.sql
PAUSE