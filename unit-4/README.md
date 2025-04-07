# Data Tests

Data tests are assertions you make about your models and other resources in your dbt project (e.g. sources, seeds and snapshots). When you run dbt test, dbt will tell you if each test in your project passes or fails. You can use data tests to improve the integrity of the SQL in each model by making assertions about the results generated.

There are two ways of defining data tests in dbt:
- **Singular**: an SQL query that returns failing rows. Saved as a .sql file within your test directory it becomes a data test.
- **Generic**: a parameterized query that accepts arguments. The test query is defined in a special test block, that is referenced by name throughout your .yml files to be used.

dbt provides four generic data tests out-of-the-box for common tests:
- *unique*
- *not_null*
- *accepted_values*
- *relationships*

**NOTE**: Custom generic tests are not covered in this tutorial.

## Generic tests

- Edit your intermediate/_schema.yml.
- Add built-in generic tests to the columns for your intermediate model, e.g.

```
- name: pickup_time
      description: "Time of pickup."
      data_tests:
        - not_null
```

## Singular tests

- At the same level as the models directory add a `tests` directory.
- Create a data test "assert_has_passengers.sql" that references your intermediate model.
- Within the tests directory create a schema.yml file to document your test.
- In the schema provide a name and description for each data test.
- Run test using `dbt test`.

**NOTE**: Don't reference singular tests in <model_name>.yml, as they are not treated as generic tests or macros, and doing so will result in an error.
