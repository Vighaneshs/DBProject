#!/usr/bin/env python3
"""
Build script for database
Usage: python build.py
"""

import os
import mysql.connector
from dotenv import load_dotenv
from pathlib import Path

# Load environment variables from .env file
load_dotenv()

DB_USER = os.getenv('DB_USER', 'root')
DB_PASSWORD = os.getenv('DB_PASSWORD')

if not DB_PASSWORD:
    print("Error: DB_PASSWORD not found in .env file!")
    exit(1)

# Database connection configuration
DB_CONFIG = {
    'host': 'localhost',
    'user': DB_USER,
    'password': DB_PASSWORD
}

def run_sql_file(cursor, filepath):
    """Execute SQL commands from a file"""
    with open(filepath, 'r') as f:
        sql = f.read()
        # Split by semicolon and execute each statement
        for statement in sql.split(';'):
            statement = statement.strip()
            if statement:
                cursor.execute(statement)

def main():
    """Main build process"""
    try:
        # Connect to MySQL server
        print("Connecting to MySQL server...")
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()
        
        # Drop database if exists
        print("Dropping existing database...")
        cursor.execute("DROP DATABASE IF EXISTS jungle_library_db;")
        
        # Create database
        print("Creating database...")
        run_sql_file(cursor, 'schema/tables/00_database.sql')
        conn.commit()
        
        # Reconnect with database selected
        cursor.close()
        conn.close()
        
        DB_CONFIG['database'] = 'jungle_library_db'
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()
        
        # Create tables
        print("Creating tables...")
        run_sql_file(cursor, 'schema/tables/01_person.sql')
        run_sql_file(cursor, 'schema/tables/02_person_phone_number.sql')
        run_sql_file(cursor, 'schema/tables/03_member.sql')
        run_sql_file(cursor, 'schema/tables/04_card_detail.sql')
        run_sql_file(cursor, 'schema/tables/05_promotion.sql')
        run_sql_file(cursor, 'schema/tables/06_card_promotion.sql')
        run_sql_file(cursor, 'schema/tables/07_guest.sql')
        run_sql_file(cursor, 'schema/tables/09_publisher.sql')
        run_sql_file(cursor, 'schema/tables/08_book.sql')
        run_sql_file(cursor, 'schema/tables/10_publisher_phone.sql')
        run_sql_file(cursor, 'schema/tables/11_publisher_address.sql')
        run_sql_file(cursor, 'schema/tables/12_comments.sql')
        run_sql_file(cursor, 'schema/tables/13_author.sql')
        run_sql_file(cursor, 'schema/tables/14_author_email.sql')
        run_sql_file(cursor, 'schema/tables/15_writes.sql')
        run_sql_file(cursor, 'schema/tables/16_employee.sql')
        run_sql_file(cursor, 'schema/tables/17_trainer.sql')
        run_sql_file(cursor, 'schema/tables/18_cataloging_manager.sql')
        run_sql_file(cursor, 'schema/tables/19_library_supervisor.sql')
        run_sql_file(cursor, 'schema/tables/20_receptionist.sql')
        run_sql_file(cursor, 'schema/tables/21_payment.sql')
        run_sql_file(cursor, 'schema/tables/22_borrowing_record.sql')
        run_sql_file(cursor, 'schema/tables/23_borrows.sql')
        run_sql_file(cursor, 'schema/tables/24_cataloging_log.sql')
        run_sql_file(cursor, 'schema/tables/25_maintains.sql')
        run_sql_file(cursor, 'schema/tables/26_inquiry.sql')

        conn.commit()
        
        # Create views
        print("Creating views...")
        run_sql_file(cursor, 'schema/views/view_top_gold_member.sql')
        run_sql_file(cursor, 'schema/views/active_receptionist.sql')
        conn.commit()
        
        # Load sample data
        print("Loading sample data...")
        run_sql_file(cursor, 'data/sample_data.sql')
        conn.commit()
        
        print("\n✓ Database build complete!")
        
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        exit(1)
    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'conn' in locals():
            conn.close()

if __name__ == '__main__':
    main()
