FROM rocker/binder
LABEL maintainer='@kaedonkers'
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}

# R environment
RUN R -e "install.packages('renv'); renv::restore(prompt=FALSE)"


# Python environment
# Following guidance from https://mybinder.readthedocs.io/en/latest/using/config_files.html
