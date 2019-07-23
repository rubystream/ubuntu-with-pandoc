FROM ubuntu:18.04

LABEL varsion="2.0" \
  maintainer="Dejan Dimic <dejan.dimic@gmail.com" \
  description="ubuntu 18.04 with pandoc and wkhtmltopdf"

RUN apt-get update && apt-get install -y build-essential git-core wget curl \
  && wget https://github.com/jgm/pandoc/releases/download/2.7.3/pandoc-2.7.3-1-amd64.deb \
  && dpkg -i pandoc-2.7.3-1-amd64.deb \
  && apt-get install -y libxext6 \
  fontconfig \
  libfreetype6 \
  libjpeg-turbo8 \
  libpng16-16 \
  libxrender1 \
  xfonts-75dpi \
  xfonts-base \
  && wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb \
  && dpkg -i wkhtmltox_0.12.5-1.bionic_amd64.deb \
  && apt-get autoremove -y && apt-get clean -y \
  && rm *.deb

CMD [ "/bin/bash"]
