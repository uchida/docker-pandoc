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
ADD 75-fonts-noto-cjk-jp.conf /etc/fonts/conf.avail/
RUN apt-get update\
 && apt-get install --no-install-recommends -y unzip=*\
 && rm -rf /var/lib/apt/lists/*\
 && curl -sSLO --tlsv1 https://noto-website.storage.googleapis.com/pkgs/NotoSerifCJKjp-hinted.zip\
 && echo "d139c06f74f982442660104dcc6d572757c58c3482b666c19db1fb475ea19531  NotoSerifCJKjp-hinted.zip" - sha256sum -c --strict -\
 && unzip -d /usr/local/share/fonts/notoserifjp/ NotoSerifCJKjp-hinted.zip\
 && curl -sSLO --tlsv1 https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip\
 && echo "73728ed28fd1f4b1ac91bf759cad5f6e8b95bde662cff88f9a26a376a613a4a9  NotoSansCJKjp-hinted.zip" - sha256sum -c --strict -\
 && unzip -d /usr/local/share/fonts/notosansjp/ NotoSansCJKjp-hinted.zip\
 && rm NotoSansCJKjp-hinted.zip NotoSerifCJKjp-hinted.zip\
 && ln -s /etc/fonts/conf.avail/75-fonts-noto-cjk-jp.conf /etc/fonts/conf.d/\
 && fc-cache -fv
WORKDIR /opt/docs
CMD ["/bin/bash"]
