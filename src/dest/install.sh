#!/usr/bin/env sh
#
# install script

prog_dir="$(dirname "$(realpath "${0}")")"
name="$(basename "${prog_dir}")"
tmp_dir="/tmp/DroboApps/${name}"
logfile="${tmp_dir}/install.log"

# boilerplate
if [ ! -d "${tmp_dir}" ]; then mkdir -p "${tmp_dir}"; fi
exec 3>&1 4>&2 1>> "${logfile}" 2>&1
echo "$(date +"%Y-%m-%d %H-%M-%S"):" "${0}" "${@}"
set -o errexit  # exit on uncaught error code
set -o nounset  # exit on unset variable
set -o pipefail # propagate last error code on pipe
set -o xtrace   # enable script tracing

# copy default configuration files
find "${prog_dir}" -type f -name "*.default" -print | while read deffile; do
  basefile="$(dirname "${deffile}")/$(basename "${deffile}" .default)"
  if [ ! -f "${basefile}" ]; then
    cp -vf "${deffile}" "${basefile}"
  fi
done

if [ -d "${prog_dir}/data/logs" ]; then
  mv "${prog_dir}/data/logs/"* "${tmp_dir}"
  rmdir "${prog_dir}/data/logs"
fi
ln -fs "${tmp_dir}" "${prog_dir}/data/logs"

if [ -f "${prog_dir}/data/config.ini" ] && grep -q "http_port = 8084" "${prog_dir}/data/config.ini"; then
  sed -e "s/http_port = 8084/http_port = 8181/g" -i "${prog_dir}/data/config.ini"
fi
