[![add-on registry](https://img.shields.io/badge/DDEV-Add--on_Registry-blue)](https://addons.ddev.com)
[![tests](https://github.com/stasadev/ddev-mydumper/actions/workflows/tests.yml/badge.svg?branch=main)](https://github.com/stasadev/ddev-mydumper/actions/workflows/tests.yml?query=branch%3Amain)
[![last commit](https://img.shields.io/github/last-commit/stasadev/ddev-mydumper)](https://github.com/stasadev/ddev-mydumper/commits)
[![release](https://img.shields.io/github/v/release/stasadev/ddev-mydumper)](https://github.com/stasadev/ddev-mydumper/releases/latest)

# DDEV MyDumper

## Overview

[MyDumper](https://github.com/mydumper/mydumper) is a MySQL Logical Backup Tool.

This add-on integrates MyDumper into your [DDEV](https://ddev.com/) project.

## Installation

To install this add-on, run:

```bash
ddev add-on get stasadev/ddev-mydumper
ddev restart
```

After installation, make sure to commit the `.ddev` directory to version control.

## Usage

| Command | Description |
| ------- | ----------- |
| `ddev mydumper` | Backup export |
| `ddev myloader` | Backup import |
| `ddev logs -s mydumper` | Check MyDumper logs |

Examples:

```bash
ddev mydumper --help
ddev myloader --help

ddev mydumper --database=db --outputdir=dump
ddev myloader --database=db --directory=dump
```

For more detailed usage instructions, visit the [MyDumper Wiki](https://github.com/mydumper/mydumper/wiki).

## Advanced Customization

To change the Docker image used by MyDumper:

```bash
ddev dotenv set .ddev/.env.mydumper --mydumper-docker-image=mydumper/mydumper:latest
ddev add-on get stasadev/ddev-mydumper
ddev restart
```

Make sure to commit the `.ddev/.env.mydumper` file to version control.

All customization options (use with caution):

| Variable | Flag | Default |
| -------- | ---- | ------- |
| `MYDUMPER_DOCKER_IMAGE` | `--mydumper-docker-image` | `mydumper/mydumper:latest` |

## Credits

**Contributed and maintained by [@stasadev](https://github.com/stasadev)**
