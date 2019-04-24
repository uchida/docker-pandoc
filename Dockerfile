FROM auchida/pandoc:base
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
