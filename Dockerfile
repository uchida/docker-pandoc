FROM auchida/texlive:2018
MAINTAINER Akihiro Uchida <uchida@turbare.net>
RUN apt-get update\
 && apt-get install --no-install-recommends -y fontconfig=* fonts-ipaexfont=*\
 && rm -rf /var/lib/apt/lists/*\
 && tlmgr install collection-latexrecommended ec lm lm-math zapfding upquote type1cm\
 && tlmgr install luatexja pbibtex-base ipaex bxbase bxjscls zxjatype zxjafont\
 && tlmgr install collection-xetex collection-luatex adobemapping\
 && tlmgr install everyhook svn-prov mathpazo
ENV PANDOC_DOWNLOAD_SUM 5efca1cd0a93824110246df1a2ed4aa676daf596d75554e1eea80dc217272b27
RUN apt-get update\
 && apt-get install --no-install-recommends -y curl=7.* ca-certificates=*\
 && rm -rf /var/lib/apt/lists/*\
 && curl -Lo pandoc.deb https://github.com/jgm/pandoc/releases/download/2.7.2/pandoc-2.7.2-1-amd64.deb\
 && echo "$PANDOC_DOWNLOAD_SUM  pandoc.deb" | sha256sum -c --strict -\
 && dpkg -i pandoc.deb && rm pandoc.deb
WORKDIR /opt/docs
CMD ["/bin/bash"]
