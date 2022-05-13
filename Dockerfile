FROM continuumio/miniconda3:4.10.3p1
# creating a working directory projects
WORKDIR /project

RUN conda install \
    xarray \ 
    netCDF4 \ 
    bottleneck \
    numpy \
    pandas \
    seaborn \
    scipy \
    matplotlib \
    jupyterlab
# We are copying a path on the host computer to a working directory in the image.

COPY ./README.md /project
COPY ./data /project/data
COPY ./notebooks /project/notebooks


# Entry point comand upon running docker image

CMD ["jupyter-lab","--ip=0.0.0.0","--no-browser","--allow-root"]