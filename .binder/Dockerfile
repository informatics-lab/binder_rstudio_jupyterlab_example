FROM rocker/binder
LABEL maintainer='@kaedonkers'
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}


RUN R -e "install.packages('renv'); renv::restore(prompt=FALSE)"

