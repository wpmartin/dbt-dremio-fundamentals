# Creating Data Models

The data transformation process using dbt + Dremio involves writing transformation logic in dbt using SQL which is executed using Dremio’s SQL engine. These SQL queries are referred to as “models” and are saved as .sql files. In this unit we will create and execute some models, starting with a raw dataset and ending with a dataset intended for business use.

## Common dbt Commands and Their Purpose

Throughout this tutorial we will use a few select dbt commands. Below are details on them to help familiarise you. **Before running any dbt command, ensure that your terminal is navigated to the folder containing your `dbt_project.yml` file.** This ensures dbt has access to the project configuration and can execute the commands successfully.

#### **Core dbt Commands**

1. **`dbt run`**
   - **Purpose**: Executes all the models defined in your project by running the SQL files and materializing the results (tables, views, or incremental models) according to the configurations.
   - **Use Case**: Use this command to build or refresh your data models in the target database.

   ```bash
   dbt run
   ```

2. **`dbt build`**

- **Purpose**: Combines multiple actions—compiling, running, testing, and building documentation—all in one command.
- **Use Case**: Use this for an end-to-end execution of models, ensuring they run, pass tests, and have documentation updated.
    
    ```
    dbt build
    ```

3. **`dbt test`**

- **Purpose**: Runs the tests defined in your tests directory or within your models to validate data quality and integrity.
- **Use Case**: Use this command to check that your data meets the defined constraints (e.g., unique values, no nulls).

    ```
    dbt test
    ```

4. **`dbt list`**

- **Purpose**: Lists the resources (models, tests, seeds, etc.) in your project.
- **Use Case**: Use this to get a quick overview of the components in your dbt project.

    ```
    dbt list
    ```

#### Tips for Using dbt Commands

- Commands like `dbt run`, `dbt test`, and `dbt build` can be scoped to specific models or directories by using selectors (e.g., `dbt run --select <model_name>`).


## Create sub-folders for the models

Within your IDE nested underneath the `models` directory create the following two directories:
 - intermediate
 - marts

At this point I also recommend to delete the `example` directory. This was auto-created with your dbt project, but we will not be using it and do not want those models to be executed.

## Create an intermediate model

- Create an .sql file called `int_trips__formatted` within the models.intermediate directory. 
- This will take the raw data from `nessie.nyc.raw.trips` and rename and reformat the attributes.
- Use `dbt run` to create the view in Dremio.
- Navigate to `nessie.nyc.intermediate` to view the created view.
- Compare the view with the source file in `nessie.nyc.raw`.

## Create a marts model

- Create an .sql file called `nyc_taxi_gross_income` within the models.marts directory. 
- This will use the intermediate view `int_trips__formatted` and drop unwanted coloumns.
- Use `dbt run` to create the view in Dremio.
- Navigate to `nessie.nyc.marts` to view the created view.