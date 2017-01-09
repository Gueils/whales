![logo](logo.png)

## Overview

`whales_cli` is a command line interface to tame the Belugas analyzers. It is based on [codeclimate cli](https://github.com/codeclimate/codeclimate)

## Prerequisites

The Whales CLI is distributed and run as a [Docker](https://www.docker.com) image. The engines that
perform the actual analyses are also Docker images. To support this, you must have Docker installed
and running locally. We also require that the Docker daemon supports connections
on the default Unix socket `/var/run/docker.sock`.

## Installation

```console
docker pull icalialabs/whales:latest
```

## Usage

### 1: Standard (Non-development)
```console
docker run \
--interactive --tty --rm \
--env API_BASE_URI=whales.herokuapp.com \
--env BELUGAS_CODE=${PWD} \
--volume /var/run/docker.sock:/var/run/docker.sock \
--volume $(pwd):/code icalialabs/whales
```

## Copyright

See [LICENSE](LICENSE.txt)