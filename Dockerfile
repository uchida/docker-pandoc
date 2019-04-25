FROM auchida/pandoc:base
ADD 75-fonts-noto-jp.conf /etc/fonts/conf.avail/
RUN apt-get update\
 && apt-get install --no-install-recommends -y unzip=*\
 && rm -rf /var/lib/apt/lists/*\
 && curl -sSLO --tlsv1 https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifJP.zip\
 && echo "362438901cb871bf84b01ff4734c668dab57b4905f39e5ec76d8b68a7a7b5fa8  NotoSerifJP.zip" - sha256sum -c --strict -\
 && unzip -d /usr/local/share/fonts/notoserifjp/ NotoSerifJP.zip\
 && curl -sSLO --tlsv1 https://noto-website-2.storage.googleapis.com/pkgs/NotoSansJP.zip\
 && echo "6886c5526628c08f1e21a84f4658ab3daf6d0233de8dc54526ccf9f40bfab18e  NotoSansJP.zip" - sha256sum -c --strict -\
 && unzip -d /usr/local/share/fonts/notosansjp/ NotoSansJP.zip\
 && rm NotoSansJP.zip NotoSerifJP.zip\
 && ln -s /etc/fonts/conf.avail/75-fonts-noto-jp.conf /etc/fonts/conf.d/\
 && fc-cache -fv
WORKDIR /opt/docs
CMD ["/bin/bash"]
