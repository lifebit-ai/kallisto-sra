FROM nfcore/base
MAINTAINER Pablo P <pablo@lifebit.ai>

COPY ./environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
ENV PATH /opt/conda/envs/kallisto-sra/bin:$PATH
