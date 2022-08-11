FROM rocker/binder
LABEL maintainer='@kaedonkers'
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}



RUN wget https://github.com/kaedonkers/holepunch_example_small/raw/main/DESCRIPTION && \
    R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2022-08-11/')); devtools::install_deps()" &&\
    R -e "install.packages('renv'); renv::init()"

RUN rm DESCRIPTION.1; exit 0
