FROM ubuntu:20.04

LABEL varsion="3.0" \
  maintainer="Dejan Dimic <dejan.dimic@gmail.com" \
  description="ubuntu 20.04 with pandoc and wkhtmltopdf"

RUN apt-get update && apt-get install -y build-essential git-core wget curl \
  && wget https://github.com/jgm/pandoc/releases/download/2.13/pandoc-2.13-1-amd64.deb \
  && dpkg -i pandoc-2.13-1-amd64.deb \
  && apt-get install -y libxext6 \
  fontconfig \
  libfreetype6 \
  libjpeg-turbo8 \
  libpng16-16 \
  libxrender1 \
  xfonts-75dpi \
  xfonts-base \
  && wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb \
  && dpkg -i wkhtmltox_0.12.6-1.focal_amd64.deb \
  && apt-get autoremove -y && apt-get clean -y \
  && rm *.deb

CMD [ "/bin/bash"]
