# E-Commerce MySQL Database Project

A MySQL database project for an e-commerce system with organized tables, views, and queries.

## Project Structure

```
DBProject/
├── build.sql                      # Main build file - run this to setup everything
├── schema/
│   ├── tables/                    # Table definitions (one relation per file)
│   └── views/                     # Database views
├── data/
│   └── sample_data.sql            # Sample data for testing
└── queries/                       # Query examples organized by topic
```

## How to Run

### Option 1: Using the build script (Easiest)

```bash
cd /Users/vighaneshs/DBProject
./build.sh
```


### Option 2: From command line manually

```bash
cd /Users/vighaneshs/DBProject
mysql -u your_username -p -e "
DROP DATABASE IF EXISTS jungle_library_db;
source schema/tables/00_database.sql;
source schema/tables/01_person.sql;
source schema/views/view_top_gold_member.sql;
source data/sample_data.sql;
SELECT 'Database build complete!' AS status;
"
```

**Important:** You must run from the project directory for relative paths to work.

This will:
1. Drop the existing database (if any)
2. Create a fresh database
3. Create all tables
4. Create all views
5. Load sample data

Perfect for testing changes from scratch!

## How to Add New Components

### Adding a New Table

1. Create a new file in `schema/tables/` (e.g., `09_wishlist.sql`)
2. Add your CREATE TABLE statement with indexes
3. Add the SOURCE command to `build.sql` in the correct order (after dependencies)

### Adding a New View

1. Create or edit a file in `schema/views/` (e.g., `view_c_analytics.sql`)
2. Add your CREATE OR REPLACE VIEW statement
3. Add the SOURCE command to `build.sql` in Step 3

### Adding New Queries

1. Create or edit a file in `queries/` (e.g., `query_i_myqueries.sql`)
2. Add your SELECT queries
3. No need to modify `build.sql` - queries are just examples to run manually

## Running Queries

After building the database, you can run any query file:

```bash
mysql -u your_username -p ecommerce_db < queries/query_a_customer.sql
```

Or copy-paste specific queries into your MySQL client.

## Requirements

- MySQL 8.0 or higher
