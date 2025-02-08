[![tests](https://github.com/stasadev/ddev-mydumper/actions/workflows/tests.yml/badge.svg)](https://github.com/stasadev/ddev-mydumper/actions/workflows/tests.yml) ![project is maintained](https://img.shields.io/maintenance/yes/2025.svg)

# DDEV MyDumper Add-on

* [What is ddev-mydumper?](#what-is-ddev-mydumper)
* [Installation](#installation)
* [Usage](#usage)

## What is ddev-mydumper?

This repository allows you to quickly install [MyDumper](https://github.com/mydumper/mydumper) into a DDEV project.

## Installation

For DDEV v1.23.5 or above run

```sh
ddev add-on get stasadev/ddev-mydumper
```

For earlier versions of DDEV run

```sh
ddev get stasadev/ddev-mydumper
```

Then restart the project

```sh
ddev restart
```


With DDEV v1.23.5+ you can choose a different MyDumper tag, the command below creates a `.ddev/.env.mydumper` file that you can commit:

```sh
ddev dotenv set .ddev/.env.mydumper --mydumper-tag v0.17.2-19
ddev add-on get stasadev/ddev-mydumper
ddev restart
```

## Usage

After installation, you can access MyDumper commands:

- `ddev mydumper`
- `ddev myloader`

MyDumper config can be adjusted with [mydumper.cnf](./mydumper/mydumper.cnf).

See [MyDumper Wiki](https://github.com/mydumper/mydumper/wiki) for detailed usage.

**Contributed and maintained by [@stasadev](https://github.com/stasadev)**
