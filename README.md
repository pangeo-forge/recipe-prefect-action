# Process Recipe Action

This actions purpose is to take a Recipe contributed via a PR, convert it to a Prefect Flow, register it with the Bakery specified in its metadata file, and run a test invocation of the Flow with a subset of the input data.

## Inputs

### `path_to_recipe_py`

**Required** The path to the `recipe.py` file within the PR. This is relative to the root of the repository.

### `path_to_meta_yaml`

**Required** The path to the `meta.yaml` file within the PR. This is relative to the root of the repository.


## Outputs

N/A

## Example usage

```yaml

uses: pangeo-forge/recipe-prefect-action@release
with:
    path_to_meta_yaml: "recipes/my_recipe/meta.yaml"
    path_to_bakeries_yaml: "bakeries.yaml"
env:
    SECRETS_CONTEXT: ${{ toJson(secrets) }}
    PREFECT__CLOUD__AUTH_TOKEN: ${{ secrets.PREFECT__CLOUD__AUTH_TOKEN }}
    PREFECT_PROJECT_NAME: ${{ secrets.PREFECT_PROJECT_NAME }}
```
