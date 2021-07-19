FROM pangeo/pangeo-forge-bakery-images:pangeonotebook-2021.06.05_prefect-0.14.22_pangeoforgerecipes-0.4.0

RUN conda run -n notebook pip install git+https://github.com/pangeo-forge/pangeo-forge-prefect@0.3 --no-deps
RUN conda run -n notebook pip install pyyaml==5.4.1
RUN conda run -n notebook pip install dacite==1.6.0


COPY action/process_recipe.py /process_recipe.py
COPY entrypoint.sh /entrypoint.sh

ENV PANGEO_NOTEBOOK_VERSION=2021.05.05
ENV PANGEO_FORGE_RECIPES_VERSION=0.4.0
ENV PREFECT_VERSION=0.14.22

ENTRYPOINT [ "sh", "/entrypoint.sh" ]
