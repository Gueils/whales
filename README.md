<p align="center">
  <img src="logo.png" height="200px" alt="whales"/>
</p>

## Overview

Whales is a tool that automatically dockerizes your applications. It works as command line interface that tames the [Belugas](#belugas-analyzers) features analyzers and outputs necessary Docker files to run your application with Docker.

<p align="center">
  <img src="https://im3.ezgif.com/tmp/ezgif-3-91ba054284.gif">
</p>

## Table of contents

- [Installation](#installation)
- [Usage](#usage)
- [Belugas Analyzers](#belugas-analyzers)
- [Contributing](#contributing)
- [Credits](#credits)

## Installation

### Prerequisites

Whales is distributed and run as a [Docker](https://hub.docker.com/r/icalialabs/whales/) image, so you only need to have Docker [installed](https://docs.docker.com/engine/installation/) and running on your machine.

### Setup

Fire up your terminal and run: 

```console
docker pull icalialabs/whales:latest
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
  --volume $(pwd):/code icalialabs/whales
```

By default Whales returns `dev.Dockerfile` and `docker-compose.yml` files, this are the files you need to run Docker on development mode. If you want the `Dockerfile` for production, just run the same command with an `-e="production` flag:

```console
docker run \
  --interactive --tty --rm \
  --env API_BASE_URI=whales.herokuapp.com \
  --env BELUGAS_CODE="${PWD}" \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume $(pwd):/code icalialabs/whales whales tame -e="production"
``` 

## Belugas Analyzers

Whales uses Belugas analyzers to detect multiple features on a project based on a code static analysis, in other words, thanks to this analyzers we can detect which language, framework, database and dependencies your project use.

Currently we have the following analyzers

- [Belugas Ruby](https://github.com/IcaliaLabs/belugas-ruby)
- [Belugas PHP](https://github.com/IcaliaLabs/belugas)
- [Belugas Python](https://github.com/IcaliaLabs/belugas-python)
- [Belugas Java](https://github.com/IcaliaLabs/belugas-java) - _In progress_

## Contributing

Everyone is freely to collaborate, just make sure you follow our [code of conduct](https://github.com/IcaliaLabs/whales-cli/blob/master/CODE_OF_CONDUCT.md). Thank you [contributors](https://github.com/IcaliaLabs/whales-cli/graphs/contributors)!

### Create an Issue

Find a bug and don't know how to fix it? Have trouble following the documentation or have a question about the project? Then by all means, please [create an issue](https://github.com/IcaliaLabs/whales-cli/issues/new).

Just please make sure you check [existing issues](https://github.com/IcaliaLabs/whales-cli/issues) to see if what you're running into has been addressed already.

### Submit a Pull Request

That's great! Just follow this steps:

1. Create a separate branch for your edits
2. Make sure your changes doesn't break the project by running your changes against current specs. **We love tests!** so it'll be even better if you create new ones when needed
3. Open your pull request against `master`

Once you've created a pull request, mainteners will chime in to review your proposed changes and to merged it if everything is right :tada:

### I want to contribute but don't know where to start

That's great also! We already have some [open issues](https://github.com/IcaliaLabs/whales-cli/issues) for you to dive in.

## Copyright

See [LICENSE](https://github.com/IcaliaLabs/whales-cli/blob/master/LICENSE.txt)

![Icalia Labs](https://raw.githubusercontent.com/IcaliaLabs/kaishi/master/logo.png)

Whales is maintained by [Icalia Labs](http://www.icalialabs.com/team)
