<!-- badges: start -->
[![Launch JupyterLab Binder](https://img.shields.io/badge/launch-JupyterLab-F5A252.svg?style=for-the-badge)](https://mybinder.org/v2/gh/informatics-lab/binder_rstudio_jupyterlab_example/main?urlpath=lab)
[![Launch RStudio Binder](https://img.shields.io/badge/launch-RStudio-579ACA.svg?style=for-the-badge)](https://mybinder.org/v2/gh/informatics-lab/binder_rstudio_jupyterlab_example/main?urlpath=rstudio) 
<!-- badges: end -->

# Binder for reproducible analyses with R, Python and Jupyter
This repo is an example of making a bunch of R and Python analyses available in the same MyBinder instance. 

Click the badges above to launch a live, interactive Jupyter Lab or RStudio session in your browser. Execute the notebooks/scripts, edit them, create new ones and upload your own data to analyse. 

The sessions last for as long as you are using them and will disappear once you are inactive for 5-10 minutes. Any unsaved progress will disappear (each session starts with exactly what is in this repo), so if you want to save any progress/edits you make you will need to download them to your computer.

This repo was broadly constructed following this [Zero-to-Binder](https://the-turing-way.netlify.app/communication/binder/zero-to-binder.html) tutorial in The Turing Way docs. I followed both the Python and R setups. I would not recommend using the `holepunch` package to setup an R Binder as the projecct has been unmaintained for over two years and when I used it failed to create a working Dockerfile. In fact, the method I settled on (described in this repo) does not define a Dockerfile at all, instead leaning on the excellent work of the [`repo2docker`](https://github.com/jupyterhub/repo2docker) folks which now have a very slick system for creating Docker and Binder instances from a GitHub repository. Kudos to them and their work.

## Analysis 1: Running an R script in RStudio
[![Analysis 1: RStudio Binder](https://img.shields.io/badge/1-Rstudio-579ACA.svg?style=for-the-badge)](https://mybinder.org/v2/gh/informatics-lab/binder_rstudio_jupyterlab_example/main?urlpath=rstudio)<br>
(Badge simply opens RStudio, not the specific file within the RStudio session)

The R script `analysis-1.R` is a simple script which plots data in the `data/` directory as scatter plots with linear regression lines fitted. Clicking the badge above will start an RStudio session, from which you can navigate to `analysis-1.R` and run it as if working in RStudio desktop.

URL to launch RStudio:<br>
`https://mybinder.org/v2/gh/<user>/<repo>/<branch>?urlpath=rstudio`

MyBinder requirements:
 - [`.binder/runtime.txt`](https://repo2docker.readthedocs.io/en/latest/config_files.html?highlight=mran#runtime-txt-specifying-runtimes) to define the version on R (from [MRAN](https://mran.microsoft.com/documents/rro/reproducibility)) to use
 - [`.binder/install.R`](https://repo2docker.readthedocs.io/en/latest/config_files.html?highlight=mran#install-r-install-an-r-rstudio-environment) (optional) where you can define packages you wish to install
 - [`.binder/postBuild`](https://repo2docker.readthedocs.io/en/latest/config_files.html?highlight=mran#postbuild-run-code-after-installing-the-environment) (optional) where `renv::restore()` is called to install the R packages defined in `renv.lock`, after the Docker image has been built.


## Analysis 2: Running a Jupyter Notebook with an R kernel in a Jupyter Notebook session
[![Analysis 2: JupyterLab Binder](https://img.shields.io/badge/2-JupyterNotebook-F5A252.svg?style=for-the-badge)](https://mybinder.org/v2/gh/informatics-lab/binder_rstudio_jupyterlab_example/main?filepath=analysis-2.ipynb)

The Jupyter Notebook `analysis-2.ipynb` is an example which plots R's built-in example dataset `mtcars`. Clicking the badge above will launch a Jupyter Notebook session for just this notebook. You can then execute the cells with a live R kernel in the background. You can add code and edit the notebook but you cannot easily add data to analyse. Please see the JupyterLab badge (above) or [Analysis 4](#analysis-4-jupyter-lab-opening-a-specific-notebook-running-python) (below) for a Jupyter Lab session, which has a better user interaface for such things.

URL to launch a standalone Jupyter Notebook:<br>
`https://mybinder.org/v2/gh/<user>/<repo>/<branch>?filepath=path/to/notebook.ipynb`

MyBinder requirements:
 - [`.binder/runtime.txt`](https://repo2docker.readthedocs.io/en/latest/config_files.html?highlight=mran#runtime-txt-specifying-runtimes) to define the version on R (from [MRAN](https://mran.microsoft.com/documents/rro/reproducibility)) to use
 - [`.binder/install.R`](https://repo2docker.readthedocs.io/en/latest/config_files.html?highlight=mran#install-r-install-an-r-rstudio-environment) (optional) where you can define packages you wish to install
 - [`.binder/postBuild`](https://repo2docker.readthedocs.io/en/latest/config_files.html?highlight=mran#postbuild-run-code-after-installing-the-environment) (optional) where `renv::restore()` is called to install the R packages defined in `renv.lock`, after the Docker image has been built


## Analysis 3: Running an RMarkdown notebook in an RShiny session

[![Analysis 3: RShiny Binder](https://img.shields.io/badge/3-RMarkdown-579ACA.svg?style=for-the-badge)](https://mybinder.org/v2/gh/informatics-lab/binder_rstudio_jupyterlab_example/main?urlpath=shiny/analysis-3.Rmd)

The RMarkdown notebook `analysis-3.Rmd` is a simple demonstration plots the `mtcars` and `cars` datasets built into R, and embeds a couple of RShiny widgets, within an RMarkdown file. This is then rendered by RShiny as a live, interactive HTML document which. Cells cannot be executed or edited like a Jupyter notebook, but the widgets can be interacted with like in an RShiny dashboard.

This configuration took a lot of digging to uncover an implementation for. The functionality [is well established within in R](https://bookdown.org/yihui/rmarkdown/shiny.html), but its implementation within the MyBinder project was unclear. These two pull requests ([#799](https://github.com/jupyterhub/repo2docker/issues/799) & [#891](https://github.com/jupyterhub/repo2docker/pull/891)) in the [repo2docker](https://github.com/jupyterhub/repo2docker) GitHub repo eventually led to a solution. Please note that in order for this setup to work the `.Rmd` file **must** be located in the base directory of the repo as it appears that subfolders are not supported for this functionality.

RShiny dashboards are also [supported in MyBinder](https://bookdown.org/yihui/rmarkdown/shiny.html) using an `server.R` and `ui.R` configuration. This setup is not demonstrated in this repo. 

URL to launch an RMarkdown file with RShiny:
`https://mybinder.org/v2/gh/<user>/<repo>/<branch>?urlpath=shiny/rmarkdownfile.Rmd`

MyBinder requirements:
 - [`.binder/runtime.txt`](https://repo2docker.readthedocs.io/en/latest/config_files.html?highlight=mran#runtime-txt-specifying-runtimes) to define the version on R (from [MRAN](https://mran.microsoft.com/documents/rro/reproducibility)) to use
 - [`.binder/install.R`](https://repo2docker.readthedocs.io/en/latest/config_files.html?highlight=mran#install-r-install-an-r-rstudio-environment) (optional) where you can define packages you wish to install. Must include `shiny`, `rmarkdown` and `shinydashboard`.
 - [`.binder/postBuild`](https://repo2docker.readthedocs.io/en/latest/config_files.html?highlight=mran#postbuild-run-code-after-installing-the-environment) (optional) where `renv::restore()` is called to install the R packages defined in `renv.lock`. Must include `shiny`, `rmarkdown` and `shinydashboard`.
 - The RMarkdown file, `rmarkdownfile.Rmd`, must be located in the base directory of the repository. It unfortunately cannot be in a subdirectory/folder of the repo as RShiny will not recognise it.
 - R package `IRkernel`, which creates an R kernel for Jupyter to use, is included in the `repo2docker` infrastructure so does not need to be included by the user.

## Analysis 4: Running a Jupyter Notebook with a Python kernel in a Jupyter Lab session

[![Analysis 4: JupyterLab Binder](https://img.shields.io/badge/4-JupyterLab-F5A252.svg?style=for-the-badge)](https://mybinder.org/v2/gh/informatics-lab/binder_rstudio_jupyterlab_example/main?urlpath=lab/tree/analysis-4.ipynb)

The Jupyter Notebook `analysis-4.ipynb` is 

URL to launch a Jupyter Notebook in Jupyter Lab:
`https://mybinder.org/v2/gh/<user>/<repo>/<branch>?urlpath=lab/tree/path/to/notebook.ipynb`

MyBinder requirements:
