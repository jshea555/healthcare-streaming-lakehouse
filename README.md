# Healthcare Event Streaming & Lakehouse Platform

**Status:** 🚧 work in progress - built in public, phase by phase. See commit history.

A streaming data platform that ingests synthetic healthcare events (eligibility, claims,
provider, pharmacy, clinical) through Apache Kafka and processes them through a
Bronze/Silver/Gold Delta Lake medallion architecture on Databricks, using PySpark and
Structured Streaming.

**All data is 100% synthetic**, generated locally with [Synthea](https://github.com/synthetichealth/synthea).
No real patient, member, claim, or provider data is used anywhere in this project.

See [`docs/architecture.md`](docs/architecture.md) for the full architecture diagram,
the reasoning behind each design choice, and an explicit breakdown of where this
free/local build diverges from a real Azure deployment.

## Tech stack

Databricks (Free Edition) - Apache Kafka - PySpark - Delta Lake - SQL - Python

## Setup

_Coming as each phase lands - see commit history and `docs/` for progress._
