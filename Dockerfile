FROM debian:latest

RUN apt-get update && apt-get install -y imagemagick && apt-get install -y wget

COPY comprimir.sh descomprimir.sh procesar.sh menu.sh generar.sh /Workspace/

WORKDIR /Workspace

VOLUME ["$PWD:/Workspace"]

CMD ["bash", "/Workspace/menu.sh"]
