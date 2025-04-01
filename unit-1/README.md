# Creating your dbt Project

With all the packages ad libraries installed, now we can create a new dbt project using the command `dbt init`, this will be begin a series of questions to setup the global configurations of your project, these configurations are stored in `~/.dbt/profiles.yml`. You can setup more localized configurations in your project as we'll discuss shortly.

### `dbt init` prompts

#### Basics
1. *name of your project*: enter whatever name you like
2. *number of type of project*: enter the number for `dremio` (may not be 1 if you have other dbt libraries installed)
3. *type of dremio project*: For this exercise choose `2` (The Following questions will differ depending on what you select for this option)
    - [2] software_with_username_password (if you are self-deploying Dremio like using Docker and want to authenticate using Username/Password)

#### Connection Settings and Authentication
4. *software host*: The host part of the url for your Dremio instance, as you are running on your laptop this would be `localhost` or `127.0.0.1`
5. *port*: The port Dremio is running on within the host, which should typically be port `9047`
6. *username*: Your Dremio Username
7. *password*: Your Dremio Password
8. *use_ssl*: Whether to use a SSL connection. Choose False as we are working locally

#### 9-12: Default View and Table Storage Location

###### Materializing Tables Location

- `object_storage_source`: must be a Dremio source where tables can be written (S3, GCP, HDFS, AWS Glue, Polaris, Nessie).
- `object_storage_path`: the sub path for your object_storage_source

These two settings establish where physical tables are created by default, in our case we want to create tables by default in `nessie.worksop.preparation` so the values will be:

- `object_storage_source`: `nessie`
- `object_storage_path`: `nyc.staging`

###### Creating Views Location

- `dremio_space`: This can be any Dremio Source that can track views (Spaces, Arctic Catalog, Nessie, Dremio Catalog).
- `dremio_space_folder`: This the sub path for the dremio_space

We want to be using Nessie and the `staging` directory, so our values will be:

- `dremio_space`: `nessie`
- `dremio_space_folder`: `nyc.staging`

#### 13 Thread

Just select the default `1` thread unless you want to use more threads.


## Customizing Configurations in dbt with Dremio

When working with dbt and Dremio, you can override the default configurations for materialized tables and views at both the project level using the `dbt_project.yml` file and the model level using the `config` function within your model file. This flexibility allows you to tailor the storage locations for your tables and views based on your specific needs.

#### Configuring Defaults for a Group of Models in `dbt_project.yml`

To configure a group of models, update the `dbt_project.yml` file under the `models` section. For example, if you want to store certain tables by default in `nessie.nyc.taging` you can specify the following configuration:

```yaml
models:
  nyc:
    staging:
      +database: nessie
      +schema: nyc.staging
      +materialized: view
```