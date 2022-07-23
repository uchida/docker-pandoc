FROM auchida/texlive
RUN apt-get update\
  && apt-get install --no-install-recommends -y fontconfig=* fonts-ipaexfont=*\
  && rm -rf /var/lib/apt/lists/*\
  && tlmgr install collection-latexrecommended ec lm lm-math zapfding upquote type1cm\
  && tlmgr install luatexja pbibtex-base ipaex bxbase bxjscls zxjatype zxjafont\
  && tlmgr install collection-xetex collection-luatex adobemapping\
  && tlmgr install everyhook svn-prov mathpazo
RUN apt-get update\
  && apt-get install --no-install-recommends -y curl=7.* ca-certificates=*\
  && rm -rf /var/lib/apt/lists/*\
  && curl -Lo pandoc.deb https://github.com/jgm/pandoc/releases/download/2.18/pandoc-2.18-1-$(uname -m|sed -e 's!x86_64!amd64!' -e 's!aarch64!arm64!').deb\
  && dpkg -i pandoc.deb && rm pandoc.deb
WORKDIR /opt/docs
CMD ["/bin/bash"]
