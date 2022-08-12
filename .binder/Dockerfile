FROM rocker/binder
LABEL maintainer='@kaedonkers'
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}

# R environment
RUN R -e "install.packages('renv'); renv::restore(prompt=FALSE)"


# Python environment
ENV CONDA_ENV="python-iris"
RUN conda env create --file environment.yml
RUN source activate ${CONDA_ENV}; ipython kernel install --user --name ${CONDA_ENV}
