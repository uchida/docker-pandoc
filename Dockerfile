FROM auchida/texlive:latest
MAINTAINER Akihiro Uchida <uchida@turbare.net>
RUN apt-get update\
 && apt-get install --no-install-recommends -y fontconfig=* fonts-ipaexfont=*\
 && rm -rf /var/lib/apt/lists/*\
 && tlmgr install collection-latexrecommended ec lm zapfding upquote\
 && tlmgr install luatexja pbibtex-base ipaex bxbase bxjscls zxjatype\
 && tlmgr install collection-xetex collection-luatex adobemapping\
 && tlmgr install everyhook svn-prov mathpazo
ENV PANDOC_DOWNLOAD_SUM db828cbab2a6d0d33f3754c4061a844ae2d1f0a01cbb12c512ef109117595dd2
RUN apt-get update\
 && apt-get install --no-install-recommends -y curl=7.* ca-certificates=*\
 && rm -rf /var/lib/apt/lists/*\
 && curl -Lo pandoc.deb https://github.com/jgm/pandoc/releases/download/1.19.2.1/pandoc-1.19.2.1-1-amd64.deb\
 && echo "$PANDOC_DOWNLOAD_SUM  pandoc.deb" | sha256sum -c --strict -\
 && dpkg -i pandoc.deb && rm pandoc.deb
WORKDIR /opt/docs
CMD ["/bin/bash"]
