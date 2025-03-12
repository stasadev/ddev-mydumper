[![tests](https://github.com/stasadev/ddev-mydumper/actions/workflows/tests.yml/badge.svg?event=schedule)](https://github.com/stasadev/ddev-mydumper/actions/workflows/tests.yml)
![project is maintained](https://img.shields.io/maintenance/yes/2025.svg)
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
| `ddev mydumper` | Export a consistent backup. |
| `ddev myloader` | Read the backup from `ddev mydumper`, connect the to destination database and import the backup. |

Examples:

```bash
ddev mydumper --help
ddev myloader --help

ddev mydumper --clear --outputdir=dump
ddev myloader --directory=dump
```

For more detailed usage instructions, visit the [MyDumper Wiki](https://github.com/mydumper/mydumper/wiki).

## Advanced Customization

You can customize MyDumper's configuration via [mydumper.cnf](./mydumper/mydumper.cnf).

To change the Docker image used by MyDumper:

```bash
ddev dotenv set .ddev/.env.mydumper --mydumper-docker-image mydumper/mydumper:latest
ddev add-on get stasadev/ddev-mydumper
ddev restart
```

Make sure to also commit the `.ddev/.env.mydumper` file to version control.

Customization options (use with caution):

| Variable | Flag | Default |
| -------- | ---- | ------- |
| `MYDUMPER_DOCKER_IMAGE` | `--mydumper-docker-image` | `mydumper/mydumper:latest` |

## Credits

Contributed and maintained by [@stasadev](https://github.com/stasadev).
