FROM auchida/pandoc:base
ADD 75-fonts-noto-cjk-jp.conf /etc/fonts/conf.avail/
RUN apt-get update\
 && apt-get install --no-install-recommends -y unzip=*\
 && rm -rf /var/lib/apt/lists/*\
 && curl -sSLO --tlsv1 https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifCJKjp-hinted.zip\
 && echo "845085c3347e75f591fc5c1957c89de6634125e9384db617979cbf71bcea580e  NotoSerifCJKjp-hinted.zip" - sha256sum -c --strict -\
 && unzip -d /usr/local/share/fonts/notoserifjp/ NotoSerifCJKjp-hinted.zip\
 && curl -sSLO --tlsv1 https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip\
 && echo "ca323a0ab974a49063884a404f233d93e0dbb51b21a5943091d9e5d5922a4e0a  NotoSansCJKjp-hinted.zip" - sha256sum -c --strict -\
 && unzip -d /usr/local/share/fonts/notosansjp/ NotoSansCJKjp-hinted.zip\
 && rm NotoSansCJKjp-hinted.zip NotoSerifCJKjp-hinted.zip\
 && ln -s /etc/fonts/conf.avail/75-fonts-noto-cjk-jp.conf /etc/fonts/conf.d/\
 && fc-cache -fv
WORKDIR /opt/docs
CMD ["/bin/bash"]
