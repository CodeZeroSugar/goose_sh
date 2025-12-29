# goose_sh

**A simple shell script wrapper for [Goose](https://pressly.github.io/goose/) – the Go-based database migration tool.**

Tired of typing out your full database connection string every single time you run a migration?  
`goose_sh` lets you configure your database URL once and then run common Goose commands with minimal typing.

## Why This Exists

Running Goose migrations usually looks like this:

```bash
goose -dir migrations postgres "user=postgres password=secret dbname=myapp sslmode=disable" up
```

With `goose_sh`, you can just do:

```bash
./goose.sh up
```

## Features

- Store your database connection string in one place
- Supports all standard Goose commands (`up`, `down`, `status`, `create`, etc.)
- Easy to customize for your project
- No dependencies beyond Goose itself and a shell environment

## Prerequisites

- [Goose](https://pressly.github.io/goose/) installed and available in your `$PATH`
  ```bash
  go install github.com/pressly/goose/v3/cmd/goose@latest
  ```
- A Unix-like shell (Bash, Zsh, etc.)
- Your database driver configured (e.g., `postgres` or `mysql`)

## Setup

1. Clone or download the script:
   ```bash
   git clone https://github.com/CodeZeroSugar/goose_sh.git
   cd goose_sh
   ```

2. Make the script executable:
   ```bash
   chmod +x goose.sh
   ```

3. **Edit the script** to set your database connection details:

   Open `goose.sh` and modify these variables near the top:

   ```bash
   DB_DRIVER="postgres"                  # or "mysql", "sqlite3", etc.
   DB_STRING="user=postgres password=secret dbname=myapp sslmode=disable host=localhost port=5432"
   MIGRATIONS_DIR="migrations"           # path to your migration files
   ```

4. (Optional) Move or symlink the script to somewhere in your `$PATH` for global use.

## Usage

Run the script with any Goose command as the first argument:

```bash
./goose.sh up                  # Migrate up to latest
./goose.sh up-by-one           # Apply next migration
./goose.sh down                # Rollback last migration
./goose.sh status              # Show migration status
./goose.sh version             # Show current database version
./goose.sh create add_users sql # Create new migration file
```

All additional arguments are passed directly to Goose.

Examples:

```bash
./goose.sh create add_posts_table sql
./goose.sh redo
./goose.sh reset
```

## Customization

Feel free to tweak the script:
- Add environment variable support
- Support multiple environments (dev/staging/prod)
- Add flags for overriding config

## License

MIT License – feel free to use, modify, and share!

---
