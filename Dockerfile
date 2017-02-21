FROM ubuntu:14.04
MAINTAINER Akira Funahashi "funa@bio.keio.ac.jp"

RUN apt-get -y update && apt-get install -y libxext-dev libxrender-dev libxtst-dev wget

RUN wget http://ns/\~funa/cd/CellDesigner-4.4-linux-x64-installer.run -O /tmp/cd.run -q && \
      chmod +x /tmp/cd.run && \
      echo 'Installing CellDesigner' && \
      /tmp/cd.run --mode unattended && \
      rm -rf /tmp/cd.run

CMD /opt/CellDesigner4.4/CellDesigner4.4.sh
