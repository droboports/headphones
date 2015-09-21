#!/usr/bin/env sh
#
# update script

prog_dir="$(dirname "$(realpath "${0}")")"
name="$(basename "${prog_dir}")"
tmp_dir="/tmp/DroboApps/${name}"
logfile="${tmp_dir}/update.log"

# boilerplate
if [ ! -d "${tmp_dir}" ]; then mkdir -p "${tmp_dir}"; fi
exec 3>&1 4>&2 1>> "${logfile}" 2>&1
echo "$(date +"%Y-%m-%d %H-%M-%S"):" "${0}" "${@}"
set -o errexit  # exit on uncaught error code
set -o nounset  # exit on unset variable
set -o xtrace   # enable script tracing

/bin/sh "${prog_dir}/service.sh" stop

if [ -f "${prog_dir}/data/config.ini" ] && grep -q "http_port = 8084" "${prog_dir}/data/config.ini"; then
  sed -e "s/http_port = 8084/http_port = 8181/g" -i "${prog_dir}/data/config.ini"
fi

# Remove old web ui
rm -fR "${prog_dir}/www"
