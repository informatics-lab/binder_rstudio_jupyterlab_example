FROM rocker/binder
LABEL maintainer='@kaedonkers'
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}



RUN wget https://github.com/kaedonkers/holepunch_example_small/raw/main/DESCRIPTION 

RUN rm DESCRIPTION.1; exit 0
