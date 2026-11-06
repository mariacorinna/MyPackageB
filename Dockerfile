FROM r-base:4.3.2

RUN R -e "install.packages('Matrix')"

COPY MyFunction.R /home/MyFunction.R
COPY frontend.R /home/frontend.R

WORKDIR /home/

ENTRYPOINT ["Rscript", "/home/frontend.R"]
