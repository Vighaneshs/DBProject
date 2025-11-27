#!/bin/bash
# Build script for database
# Usage: ./build.sh [mysql_user] [mysql_password]

MYSQL_USER="${1:-root}"

cd "$(dirname "$0")"

echo "Building database..."

# Function to run SQL file
run_sql() {

    mysql -u "$MYSQL_USER" < "$1"
}

# Drop database
echo "DROP DATABASE IF EXISTS jungle_library_db;" | /usr/local/mysql/bin/mysql -u "$MYSQL_USER" $([ -n "$MYSQL_PASSWORD" ] && echo "-p$MYSQL_PASSWORD" || echo "-p")

# Run each SQL file
echo "Creating database..."
run_sql schema/tables/00_database.sql

echo "Creating tables..."
run_sql schema/tables/01_person.sql

echo "Creating views..."
run_sql schema/views/view_top_gold_member.sql

echo "Loading sample data..."
run_sql data/sample_data.sql

echo ""
echo "✓ Database build complete!"
