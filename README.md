# docker-pandoc

[![License](https://img.shields.io/github/license/uchida/docker-pandoc.svg?maxAge=2592000)](https://tldrlegal.com/license/creative-commons-cc0-1.0-universal)

docker image with pandoc and texlive, including luatexja and bxjscls to generate Japanese PDF files.

Docker image is available as [auchida/pandoc](https://hub.docker.com/r/auchida/pandoc/) in Docker Hub.

## Image tags

- `latest`, `base`

## Usage

### For `base`/`latest`

```console
$ docker run -v $PWD:/opt/docs auchida/pandoc pandoc -V documentclass=ltjsarticle --pdf-engine=lualatex -o docs.pdf docs.md
```

About pandoc, consult [Pandoc - About pandoc](http://pandoc.org/) for more information.

## License

Contents on this repository are dedicated to [![CC0 public domain](http://i.creativecommons.org/p/zero/1.0/80x15.png "CC0 public domain")](https://creativecommons.org/publicdomain/zero/1.0/).
No rights reserved.

License for distributed Docker images follows one of [Debian Project](https://www.debian.org/legal/licenses/), [TeXLive](https://www.tug.org/texlive/copying.html),
[Noto CJK fonts](https://github.com/googlei18n/noto-cjk/blob/master/LICENSE), [Pandoc](https://github.com/jgm/pandoc/blob/master/COPYING.md) and its dependencies.
