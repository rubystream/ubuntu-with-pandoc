FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y build-essential git-core
RUN apt-get install -y wget curl

# install pandoc - https://pandoc.org/
RUN wget https://github.com/jgm/pandoc/releases/download/2.5/pandoc-2.5-1-amd64.deb
RUN dpkg -i pandoc-2.5-1-amd64.deb
 
RUN apt-get install -y libxext6
RUN apt-get install -y fontconfig
RUN apt-get install -y libfreetype6
RUN apt-get install -y libjpeg-turbo8
RUN apt-get install -y libpng16-16
RUN apt-get install -y libxrender1
RUN apt-get install -y xfonts-75dpi
RUN apt-get install -y xfonts-base
 
# install wkhtmltopdf - https://wkhtmltopdf.org/
RUN wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
RUN dpkg -i wkhtmltox_0.12.5-1.bionic_amd64.deb
 
RUN apt-get autoremove -y
RUN apt-get clean -y
 
CMD [ "/bin/bash"]
