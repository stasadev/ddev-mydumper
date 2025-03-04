setup() {
  set -eu -o pipefail
  export DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )/.."
  export TESTDIR=~/tmp/test-mydumper
  mkdir -p $TESTDIR
  export PROJNAME=test-mydumper
  export DDEV_NONINTERACTIVE=true
  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1 || true
  cd "${TESTDIR}"
  ddev config --project-name=${PROJNAME}
  ddev start -y >/dev/null
}

health_checks() {
  ddev mydumper --clear --outputdir dump
  ddev myloader --directory dump
}

teardown() {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1
  [ "${TESTDIR}" != "" ] && rm -rf ${TESTDIR}
}

@test "install from directory" {
  set -eu -o pipefail
  cd ${TESTDIR}
  echo "# ddev add-on get ${DIR} with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev add-on get ${DIR}
  ddev restart
  health_checks
}

@test "install from directory with MyDumper tag v0.17.2-19" {
  set -eu -o pipefail
  cd ${TESTDIR}
  echo "# ddev dotenv set .ddev/.env.mydumper --mydumper-tag v0.17.2-19"
  ddev dotenv set .ddev/.env.mydumper --mydumper-tag v0.17.2-19
  echo "# ddev add-on get ${DIR} with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev add-on get ${DIR}
  ddev restart
  ddev mydumper -V | grep "^mydumper v0.17.2-19"
  health_checks
}

# bats test_tags=release
@test "install from release" {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  echo "# ddev add-on get stasadev/ddev-mydumper with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev add-on get stasadev/ddev-mydumper
  ddev restart >/dev/null
  health_checks
}
