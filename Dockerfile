FROM pangeo/pangeo-notebook:2021.05.04

COPY ./requirements.txt requirements.txt
RUN conda run -n notebook pip uninstall -y -r requirements.txt
RUN conda run -n notebook pip install -I -r requirements.txt

RUN pip install git+https://github.com/pangeo-forge/pangeo-forge-prefect@0.2
COPY action/process_recipe.py /process_recipe.py
COPY entrypoint.sh /entrypoint.sh

ENV PANGEO_NOTEBOOK_VERSION=2021.05.04
ENV PANGEO_FORGE_RECIPES_VERSION=0.3.3
ENV PREFECT_VERSION=0.14.7

ENTRYPOINT [ "sh", "/entrypoint.sh" ]
