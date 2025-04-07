# Reflections

Dremio reflections are a unique Dremio query acceleration functionality. They are built on the principles of materialized Views, creating optimized representations of the original data to speed up read operations. Queries do not need to reference reflections directly. Instead, Dremio rewrites queries on the fly to use the reflections that satisfy them.

## Enable Reflections

To enable your dbt project to utilise reflections, you must configure your `dbt_project.yml`. At the bottom of the .yml add the following:

```
vars:
      dremio:reflections_metadata_enabled: true
```

## Create Reflections

You create reflections as a model .sql file in dbt. However, unlike a typical model which is a SELECT statement, a reflection is defined as a configuration. 

- Create a "reflections" directory within the models directory.
- Create a raw reflection for your intermediate model `int_trips__raw_reflection.sql`.
- Execute `dbt run` and view the Reflection in the Dremio UI.
- Create an aggregate reflection for your intermediate model `int_trips__agg_reflection.sql`
- Execute `dbt run` and view the Reflection in the Dremio UI.
