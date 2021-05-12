FROM pangeo/pangeo-notebook:2021.05.04

COPY ./requirements.txt requirements.txt
RUN conda run -n notebook pip uninstall -y -r requirements.txt
RUN conda run -n notebook pip install -I -r requirements.txt

RUN pip install git+https://github.com/pangeo-forge/pangeo-forge-prefect@0.1
COPY action/process_recipe.py /process_recipe.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "sh", "/entrypoint.sh" ]
