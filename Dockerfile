FROM rust:1.67 AS chef 
RUN cargo install cargo-chef 
WORKDIR /app

FROM chef AS planner
COPY . .
RUN cargo chef prepare  --recipe-path recipe.json

FROM chef AS builder
COPY --from=planner /app/recipe.json recipe.json
RUN cargo chef cook --release --recipe-path recipe.json
COPY . .
RUN cargo build --release

FROM rust:1.67-slim AS runtime
WORKDIR /app
COPY --from=builder /app/target/release/zero_to_production zero_to_production
ENTRYPOINT ["/app/zero_to_production"]
