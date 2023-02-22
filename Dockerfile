FROM ubuntu:22.04

LABEL varsion="4.0" \
  maintainer="Dejan Dimic <dejan.dimic@gmail.com" \
  description="ubuntu 22.04 with pandoc and wkhtmltopdf"

RUN apt-get update && apt-get install -y build-essential git-core wget curl \
  && wget https://github.com/jgm/pandoc/releases/download/3.1/pandoc-3.1-1-amd64.deb \
  && dpkg -i pandoc-3.1-1-amd64.deb \
  && apt-get install -y libxext6 \
  fontconfig \
  libfreetype6 \
  libjpeg-turbo8 \
  libpng16-16 \
  libxrender1 \
  xfonts-75dpi \
  xfonts-base \
  && wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_amd64.deb \
  && dpkg -i wkhtmltox_0.12.6.1-2.jammy_amd64.deb \
  && apt-get autoremove -y && apt-get clean -y \
  && rm *.deb

CMD [ "/bin/bash"]
