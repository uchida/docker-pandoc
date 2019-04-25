# docker-pandoc

[![License](https://img.shields.io/github/license/uchida/docker-pandoc.svg?maxAge=2592000)](https://tldrlegal.com/license/creative-commons-cc0-1.0-universal)
[![MicroBadger](https://images.microbadger.com/badges/image/auchida/pandoc.svg)](http://microbadger.com/images/auchida/pandoc)

docker image with pandoc and texlive, including luatexja and bxjscls to generate Japanese PDF files.
Optionally Noto Sans/Serif fonts are available `noto-jp` and `noto-cjk-jp` tag.

- `noto-cjk-jp` uses language-specific OpenType version of Noto fonts.
- `noto-jp` uses region-specific subset OpenType of Noto fonts, has less glyphs and image size as well.

see [Noto CJK – Google Noto Fonts](https://www.google.com/get/noto/help/cjk/) for more information

Docker image is available as [auchida/pandoc](https://hub.docker.com/r/auchida/pandoc/) in Docker Hub.

## Image tags

- `latest`, `base`
- `noto-cjk-jp`
- `noto-jp`

## Usage

### For `base`/`latest`

```console
$ docker run -v $PWD:/opt/docs auchida/pandoc pandoc -V documentclass=ltjsarticle --pdf-engine=lualatex -o docs.pdf docs.md
```

or

```console
$ docker run -v $PWD:/opt/docs auchida/pandoc pandoc -V documentclass=bxjsarticle -V classoption=pandoc,standard --pdf-engine=xelatex -o docs.pdf docs.md
```

About pandoc, consult [Pandoc - About pandoc](http://pandoc.org/) for more information.

### For `noto-cjk-jp`


```console
$ docker run -v $PWD:/opt/docs auchida/pandoc:noto-cjk-jp pandoc -V documentclass=bxjsarticle -V classoption=pandoc,standard,jafont=noto-otf --pdf-engine=lualatex -o docs.pdf docs.md
```

or

```console
$ docker run -v $PWD:/opt/docs auchida/pandoc:noto-cjk-jp pandoc -V documentclass=bxjsarticle -V classoption=pandoc,standard,jafont=noto --pdf-engine=xelatex -o docs.pdf docs.md
```

If you want to use LuaLaTeX and ltjs classes, instead of bxjs classes, put `-H|--include-in-header` option with a following file:

```latex
\usepackage[noto-otf]{luatexja-preset}
```

### For `noto-jp`

```console
$ docker run -v $PWD:/opt/docs auchida/pandoc:noto-jp pandoc -V documentclass=bxjsarticle -V classoption=pandoc,standard,jafont=noto-jp --pdf-engine=xelatex -o docs.pdf docs.md
```

One may use `noto-jp` with LuaLaTeX by `-H|--include-in-header` option with `\set*jfont` commands in the `luatexja-fontspec` package.

## License

Contents on this repository are dedicated to [![CC0 public domain](http://i.creativecommons.org/p/zero/1.0/80x15.png "CC0 public domain")](https://creativecommons.org/publicdomain/zero/1.0/).
No rights reserved.

License for distributed Docker images follows one of [Debian Project](https://www.debian.org/legal/licenses/), [TeXLive](https://www.tug.org/texlive/copying.html),
[Noto CJK fonts](https://github.com/googlei18n/noto-cjk/blob/master/LICENSE), [Pandoc](https://github.com/jgm/pandoc/blob/master/COPYING.md) and its dependencies.
