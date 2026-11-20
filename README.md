<div align="center">
<img src="assets/brand-logo.svg" alt="Arya Fatthurahman" width="120" />
</div>

# Apache Kylin Lab

<sub>Run Apache Kylin standalone in Docker and explore OLAP cubes over Hive-style tables.</sub>

<p>
  <img src="https://img.shields.io/badge/Database-Apache%20Kylin-F5A623?style=flat-square" alt="Database: Apache Kylin" />
  <img src="https://img.shields.io/badge/Category-OLAP%20%2F%20pre--aggregation-6366F1?style=flat-square" alt="Category: OLAP / pre-aggregation" />
  <img src="https://img.shields.io/badge/Runs%20in-Docker-2496ED?style=flat-square&logo=docker&logoColor=white" alt="Runs in Docker" />
  <img src="https://img.shields.io/badge/License-MIT-22C55E?style=flat-square" alt="License: MIT" />
  <a href="https://github.com/devarent/apache-kylin-lab/actions/workflows/compose-check.yml"><img src="https://github.com/devarent/apache-kylin-lab/actions/workflows/compose-check.yml/badge.svg" alt="compose-check" /></a>
</p>

## What this lab is

Apache Kylin pre-aggregates large datasets into cubes so BI queries return in sub-second time. This lab starts the standalone image, opens the Kylin web UI, and gives you Hive-style DDL and queries to understand the model, cube, and query flow.

## Quickstart

```bash
docker compose up -d   # needs about 8 GB RAM; first start takes 3-5 minutes
open http://localhost:7070/kylin   # admin / KYLIN
Create a project, load the sample `learn_kylin` dataset, then build a model and cube.
Run the queries in examples/01_queries.sql from the Kylin web UI or a JDBC client.
```

## Connection details

| Field | Value |
| --- | --- |
| Web UI | `http://localhost:7070/kylin` |
| User | `admin` |
| Password | `KYLIN` |
| JDBC URL | `jdbc:kylin://localhost:7070/learn_kylin` |
| Hadoop UI | `http://localhost:8088` |
| HDFS UI | `http://localhost:50070` |

## Examples

| File | What it shows |
| --- | --- |
| [`docker-compose.yml`](docker-compose.yml) | Engine, ports, and persistent volume. |
| [`.github/workflows/compose-check.yml`](.github/workflows/compose-check.yml) | Validates the Compose file on every push. |
| [`examples/01_queries.sql`](examples/01_queries.sql) | Hive-style DDL and analytical queries. |
| [`examples/02_model_notes.md`](examples/02_model_notes.md) | Checklist for the model and cube in the web UI. |

## Exercises

1. Build a cube with `country` and `ordered_at` dimensions and compare query latency before and after.
2. Add a derived dimension for the order month and rebuild the cube.
3. Use the Kylin REST API to list cubes and trigger a build.
4. Connect DBeaver with the Kylin JDBC driver and run the same aggregation.

## Notes and limits

- The standalone image bundles Hadoop, Hive, HBase, and Kylin. It needs roughly 8 GB of RAM and several minutes to start.
- Default credentials are `admin` / `KYLIN`. Change them if the UI is reachable from other machines.
- Kylin is an OLAP layer, not a general-purpose transactional database.
- The image is large; pull it before you need it if bandwidth is limited.

## Run it from anywhere

This lab publishes its ports on `127.0.0.1` only. To use it from another country, do **not** open the database port to the internet. Pick one:

- **VPS + private tunnel:** run the lab on a small Ubuntu VPS, keep the port closed, and connect through WireGuard or `ssh -L`.
- **Managed service:** use a managed free tier for this engine and point the same examples at its connection string.
- **HTTP UI only:** if the engine has a web UI, put it behind Caddy with TLS and basic auth.

The shared checklist, provider map, and commands are in **[REMOTE-ACCESS.md](https://github.com/devarent/database-labs/blob/main/REMOTE-ACCESS.md)**.

## Cleanup

```bash
docker compose down -v
```

`-v` also removes the named volume, so the next start is a clean slate.

## References

- [Apache Kylin documentation](https://kylin.apache.org/docs/)
- [Kylin Docker image](https://hub.docker.com/r/apachekylin/apache-kylin-standalone)
- [Kylin REST API](https://kylin.apache.org/docs/development/rest.html)

---

<sub>Part of the <a href="https://github.com/devarent/database-labs">database-labs</a> collection: 26 database engines, one index.</sub>

## License

MIT (c) 2026 Arya Fatthurahman. See [LICENSE](LICENSE).
