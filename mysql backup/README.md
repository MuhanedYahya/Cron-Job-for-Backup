# MySQL Backup Script

This script performs a backup of MySQL database, logs the backup process, and manages backup retention by keeping only the latest 3 backups.

## Usage

1. Update the `MYSQL_USERNAME` and `MYSQL_PASSWORD` variables with your MySQL username and password.
2. Update the `LOG_FILE` and `OUTPUT_FILE` paths
3. create `~/database_backups/` and `~/backup_logs/` directories

## Script Details

- **MYSQL_PASSWORD**: MySQL password for authentication.
- **MYSQL_USERNAME**: MySQL username for authentication.
- **LOG_FILE**: Path to the log file for recording the backup process.
- **OUTPUT_FILE**: Path to save the backup SQL file.
- **Backup Retention**: The script keeps only the latest 3 backups in the `~/database_backups/` and `~/backup_logs/` directories.

