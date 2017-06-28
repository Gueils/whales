[![Code Climate](https://codeclimate.com/github/WhalesIL/whales/badges/gpa.svg)](https://codeclimate.com/github/WhalesIL/whales)
[![Test Coverage](https://codeclimate.com/github/WhalesIL/whales/badges/coverage.svg)](https://codeclimate.com/github/WhalesIL/whales/coverage)
[![Made with Love by Icalia Labs](https://img.shields.io/badge/With%20love%20by-Icalia%20Labs-ff3434.svg)](https://github.com/IcaliaLabs)

<p align="center">
  <img src="whales.png" height="200px" alt="whales"/>
</p>

## Overview

Whales is a tool that automatically dockerizes your applications. It works as command line interface that tames the [Belugas](#belugas-analyzers) features analyzers and outputs necessary Docker files to run your application with Docker.

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/4439027/24180592/55b98dd2-0e7b-11e7-8a45-04ff3abc1355.gif">
</p>

## Table of contents

- [Why](#why)
- [Installation](#installation)
- [Usage](#usage)
- [Belugas Analyzers](#belugas-analyzers)
- [Contributing](#contributing)
- [Credits](#credits)

## Why?

Dockerizing your legacy apps was never this easy. We present you the Whales ecosystem: A set of tools to automatically dockerize your applications.

## Installation

### Prerequisites

Whales is distributed and run as a [Docker](https://hub.docker.com/r/whalesil/whales/) image, so you only need to have Docker [installed](https://docs.docker.com/engine/installation/) and running on your machine.

### Setup

Fire up your terminal and run: 

```console
docker pull whalesil/whales:latest
```

And that's it! 

## Usage

Here's where the magic begins, first of all in your terminal go to the project directory you want to dockerize:

```console
cd code/path_to_project/
```

And then just execute the following command:

```console
docker run \
  --interactive --tty --rm \
  --env API_BASE_URI=whales.herokuapp.com \
  --env BELUGAS_CODE="${PWD}" \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume $(pwd):/code whalesil/whales
```

By default Whales returns `dev.Dockerfile` and `docker-compose.yml` files, this are the files you need to run Docker on development mode. If you want the `Dockerfile` for production, just run the same command with an `-e="production` flag:

```console
docker run \
  --interactive --tty --rm \
  --env API_BASE_URI=whales.herokuapp.com \
  --env BELUGAS_CODE="${PWD}" \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume $(pwd):/code whalesil/whales whales tame -e="production"
``` 

## Belugas Analyzers

Whales uses Belugas analyzers to detect multiple features on a project based on a code static analysis, in other words, thanks to this analyzers we can detect which language, framework, database and dependencies your project use.

Currently we have the following analyzers

- [Belugas Ruby](https://github.com/WhalesIL/belugas-ruby)
- [Belugas PHP](https://github.com/WhalesIL/belugas)
- [Belugas Python](https://github.com/WhalesIL/belugas-python)

## Contributing

Everyone is freely to collaborate, just make sure you follow our [code of conduct](https://github.com/WhalesIL/whales/blob/master/CODE_OF_CONDUCT.md). Thank you [contributors](https://github.com/WhalesIL/whales/graphs/contributors)!

### Create an Issue

Find a bug and don't know how to fix it? Have trouble following the documentation or have a question about the project? Then by all means, please [create an issue](https://github.com/WhalesIL/whales/issues/new).

Just please make sure you check [existing issues](https://github.com/WhalesIL/whales/issues) to see if what you're running into has been addressed already.

### Submit a Pull Request

That's great! Just follow this steps:

1. Create a separate branch for your edits
2. Make sure your changes doesn't break the project by running your changes against current specs. **We love tests!** so it'll be even better if you create new ones when needed
3. Open your pull request against `master`

Once you've created a pull request, mainteners will chime in to review your proposed changes and to merged it if everything is right :tada:

### I want to contribute but don't know where to start

That's great also! We already have some [open issues](https://github.com/WhalesIL/whales/issues) for you to dive in.

## Copyright

See [LICENSE](https://github.com/WhalesIL/whales/blob/master/LICENSE.txt)

![Icalia Labs](https://raw.githubusercontent.com/icalialabs/kaishi/master/logo.png)

Whales is maintained by [Icalia Labs](http://www.icalialabs.com/team)
