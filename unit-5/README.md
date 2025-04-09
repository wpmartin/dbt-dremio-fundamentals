# Reflections

Dremio reflections are a unique Dremio query acceleration functionality. They are built on the principles of materialized Views, creating optimized representations of the original data to speed up read operations. Queries do not need to reference reflections directly. Instead, Dremio rewrites queries on the fly to use the reflections that satisfy them.

In this unit we will cover has to enable your dbt project to use reflections and how to create reflections using dbt.

## Enable Reflections

To enable your dbt project to utilise reflections, you must configure your `dbt_project.yml`. At the bottom of the .yml add the following:

```
vars:
      dremio:reflections_metadata_enabled: true
```

## Create Reflections in dbt

You create reflections as a model .sql file in dbt. However, unlike a typical model which is a SELECT statement, a reflection is defined as a configuration. Let us create some reflections to demonstrate this syntax difference.

- Create a `reflections` directory within the models directory.
- Create a raw reflection for your intermediate model `int_trips__raw_reflection.sql`.
- Create an aggregate reflection for your intermediate model `int_trips__agg_reflection.sql`
- Execute `dbt run` and view the Reflections in the Dremio UI in the dataset details page for `int_trips__formatted`.

## Victory Lap

As a final step to cap off the tutorial use `dbt build` to run all the tests and models.