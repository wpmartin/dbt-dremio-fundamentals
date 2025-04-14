# Creating your dbt Project

With all the packages and libraries installed, now we can create a new dbt project using the command `dbt init nyc`, this will be begin a series of questions to setup the global configurations of a project called `nyc`, whose configurations are stored in `~/.dbt/profiles.yml`.

### `dbt init` prompts

#### Basics
1. *number of type of project*: enter the number for `dremio` (may not be 1 if you have other dbt libraries installed)
2. *type of dremio project*: For this exercise choose `2` (The Following questions will differ depending on what you select for this option)
    - [2] software_with_username_password (if you are self-deploying Dremio like using Docker and want to authenticate using Username/Password)

#### Connection Settings and Authentication
3. **software host**: The host part of the url for your Dremio instance, as you are running on your laptop this would be `localhost` or `127.0.0.1`
4. **port**: The port Dremio is running on within the host, which should typically be port `9047`
5. **username**: Your Dremio Username
6. **password**: Your Dremio Password
7. **use_ssl**: Whether to use a SSL connection. Choose `False` as we are working locally

#### 8-11: Default View and Table Storage Location

###### Materializing Tables Location

- `object_storage_source`: must be a Dremio source where tables can be written (S3, GCP, HDFS, AWS Glue, Polaris, Nessie).
- `object_storage_path`: the sub path for your object_storage_source

These two settings establish where physical tables are created by default, in our case we want to create tables by default in `nessie.nyc.raw` so the values will be:

8. **object_storage_source**: `nessie`
9. **object_storage_path**: `nyc.raw`

###### Creating Views Location

- `dremio_space`: This can be any Dremio Source that can track views (Spaces, Arctic Catalog, Nessie, Dremio Catalog).
- `dremio_space_folder`: This the sub path for the dremio_space

We want to be using Nessie and the `raw` directory, so our values will be:

10. **dremio_space**: `nessie`
11. **dremio_space_folder**: `nyc.raw`

#### 13: Thread

Select the default `1`.


## Customizing Configurations in dbt With Dremio

When working with dbt and Dremio, you can override the default configurations for materialized tables and views at both the project level using the `dbt_project.yml` file and the model level using the `config` function within your model file. This flexibility allows you to tailor the storage locations for your tables and views based on your specific needs.

#### Configuring Defaults for a Group of Models

To configure a group of models, update the `dbt_project.yml` file under the `models` section. Here you will want to add config settings for the following:
- database: override the default database when dbt creates resources in your data platform.
- schema: override the default schema dbt creates your models in.
- materialized: how your model is persited in your database. 

Open `dbt_project.yml` and edit the `models:nyc` section to as follows:

```yaml
models:
  nyc:
    intermediate:
      +database: nessie
      +schema: nyc.intermediate
      +materialized: view
    marts:
      +database: nessie
      +schema: nyc.marts
      +materialized: view
```

This will define custom config settings for two model layers, **intermediate** and **marts**, that we will be using for this tutorial. 

With Dremio integration we define our models as either **table** or **view**, and our reflections (covered in unit 5) as **reflection**.


### Configuring Settings for an Individual Model

To set custom configurations settings for a specific model you can use the `config()` function within the model file. This will override the model-group configuration specificied in the `dbt_project.yml` file.

To override the materialization method to `table` put the following at the top of a model file, above the SELECT statement:

```
{{ config(materialized='table') }}
```

Likewise you can also overide the Dremio configuration options you selected when creating your dbt project, such as the `object_storage_source`. Just as with the materialized config, you specify these custom settings with the `config()` function at the top of the model file, e.g.:

```
{{ config(
    object_storage_source='nessie',
    object_storage_path='nyc.silver',
    dremio_space='default',
    dremio_space_folder='custom_views'
) }}
```
