# Documentation

The purpose behind the modular code design of dbt is to have reliable, reusable components. As such, you need to ensure that anyone using a given model should be able to understand what it is intended to do and what data it produces. To support this, like in many other approaches to coding, we use documentation.

In this unit we will review three documentation functions of dbt and how to integrate these with Dremio:
 - descriptions in a schema.yml
 - doc blocks
 - tags

 ## Synch dbt documentation with Dremio

To enable this feature add the following property to your `dbt_project.yml`:

```
models:
  nyc:
    +persist_docs:
      relation: true
```
Now whenever you execute `dbt run` all existing, compatible documentation for all models will now synch with Dremio. 

## Schema.yml

The `schema.yml` file in dbt is a key component of your project that defines metadata, data tests, and documentation for your models (data tests will be covered in the next unit). It provides a centralized place to describe your data and enforce quality standards, making your dbt project easier to manage and understand. In this excercise we will be creating a schema.yml file and using it to write a [description](https://docs.getdbt.com/reference/resource-properties/description) for our intermediate model. 

- Within `models.intermediate` create the file `_schema.yml`.
- Add a `models` property and provide the name and description for the `int_trips__formatted` model.
- Within this add a `columns` property and provide a name and description for each of the columns.
- Execute the command `dbt run`.
- Navigate to the Dremio UI and look at the dataset details for `int_trips__formatted`.
- The dataset description will be visible under **Wiki**, found in the dataset overview sidebar and under **Details** in the dataset details page.

## Doc Blocks

You can also create documentation using markdown, referred to as [doc blocks](https://docs.getdbt.com/docs/build/documentation#using-docs-blocks). This enables more elaborate formatting for better readability.

In this exercise you will create a doc block describing your marts model and link the two together. 

 - Within `models.marts` create the file `nyc_taxi_gross_income.md`.
 - Describe the `nyc_taxi_gross_income` model and its attributes.
 - Within `models.marts` create a `_schema.yml` file.
 - Add a `models` property and provide the name as `nyc_taxi_gross_income.md`.
 - Under description provide a docs link to your doc block .md file.
 - Execute `dbt run`.
 - Review the doc block under **Wiki** in the Dremio UI.

 ## Tags

You can also add tags to your models. These can be used as a semantic layer for users and as a resource selection to run/build/test models belonging to specific tags.

- Edit the intermediate `_schema.yml`.
- At the same level as `description` add a new property:

```
config:
      tags: ['cleaned', 'silver']
```

- Execute `dbt run` and review in the Dremio UI in the dataset details sidepanel and overview page.

Another method of adding tags to a model is to use the `dbt_project.yml`. Add tags to your marts model `nyc_taxi_gross_income` by adding the `+tag` config under `marts`:

```
 marts:
      +database: nessie
      +schema: nyc.marts
      +materialized: view
      +tags: ['gold']
```
