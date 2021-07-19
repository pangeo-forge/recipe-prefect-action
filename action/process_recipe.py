import sys
import os
import json
import xarray
import zarr
from pangeo_forge_prefect.flow_manager import register_flow
from pangeo_forge_prefect.meta_types.versions import Versions


def getenv(key, default):
    value = os.getenv(key, default)
    if value is None:
        value = default
    elif type(value) == str:
        if len(value) == 0:
            value = default
    return value


def main():
    print(xarray.__version__)
    print(zarr.__version__)
    secrets = json.loads(os.environ["SECRETS_CONTEXT"])
    print(secrets)
    meta_yaml = os.environ["INPUT_PATH_TO_META_YAML"]
    bakeries_yaml = os.environ["INPUT_PATH_TO_BAKERIES_YAML"]
    prune = getenv("INPUT_PRUNE", False) 
    versions = Versions(
        pangeo_notebook_version=os.environ["PANGEO_NOTEBOOK_VERSION"],
        pangeo_forge_version=os.environ["PANGEO_FORGE_RECIPES_VERSION"],
        prefect_version=os.environ["PREFECT_VERSION"],
    )
    register_flow(meta_yaml, bakeries_yaml, secrets, versions, prune=prune)

if __name__ == "__main__":
    main()
