import sys
import os
import json
import xarray
from pangeo_forge_prefect.flow_manager import register_flow
from pangeo_forge_prefect.meta_types.versions import Versions

def main():
    print(xarray.__version__)
    secrets = json.loads(os.environ["SECRETS_CONTEXT"])
    print(secrets)
    meta_yaml = os.environ["INPUT_PATH_TO_META_YAML"]
    bakeries_yaml = os.environ["INPUT_PATH_TO_BAKERIES_YAML"]
    versions = Versions(
        pangeo_notebook_version=os.environ["PANGEO_NOTEBOOK_VERSION"],
        pangeo_forge_version=os.environ["PANGEO_FORGE_RECIPES_VERSION"],
        prefect_version=os.environ["PREFECT_VERSION"],
    )
    register_flow(meta_yaml, bakeries_yaml, secrets, versions)

if __name__ == "__main__":
    main()
