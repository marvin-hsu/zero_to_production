# Zero to Production in Rust

This repository contains Rust code for practicing the concepts taught in the
book "[Zero To Production In Rust](https://www.zero2prod.com/index.html)". The application is currently deployed on
Fly.io, and you can access it
at [https://marvinhsu-zero-to-production.fly.dev/](https://marvinhsu-zero-to-production.fly.dev/).
Additionally, [Swagger-UI](https://marvinhsu-zero-to-production.fly.dev/swagger-ui/) is available.

## Differences

The following table shows the differences between the book and this repository:

| Item             | Book          | Repository          |
|:-----------------|:--------------|:--------------------|
| Framework        | Actix-web     | Axum                |
| Platform         | DigitalOcean  | Fly.io              |
| DB tool          | sqlx          | seaORM              |
| Integration test | rust build-in | pytest              |
| CI Accelerate    | Cargo-chief   | Github-action cache |
| Auth             | Session       | JWT                 |
| Frontend         | html          | Svelte              |

## Frontend

Website fronted is under
preparing. [https://marvinhsu-zero-to-production-website.fly.dev/](https://marvinhsu-zero-to-production-website.fly.dev/)

## SeaOEM migration

1. Install sea-orm cli if haven't done
    ```bash
    cargo install sea-orm-cli
    ```
2. Set up database connection string in `.env` file
3. Use `up` command to apply all pending migrations
    ```bash
    sea-orm-cli migrate up
    ```
4. Use `generate` command to generate model and entity files
    ```bash
    sea-orm-cli migrate generate NAME_OF_MIGRATION
   ```
5. Generate entities from database
    ```bash
    sea-orm-cli generate entity -o src/entity
    ```