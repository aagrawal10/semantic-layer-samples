# semantic-layer-samples

Small semantic-layer definitions for the **jaffle shop** domain, used to test
how a data agent reads a semantic layer kept in Git. The domain (orders,
customers, order items, locations) follows dbt Labs' public
[jaffle-shop](https://github.com/dbt-labs/jaffle-shop) project (Apache-2.0);
the files here were written from scratch for testing.

- `lookml/` — a LookML project (`jaffle_shop` model, four views)
- `cube/` — a Cube data model (YAML cubes and a view)
- `metricflow/` — standalone MetricFlow semantic models and metrics
