### HEADPHONES ###
_build_headphones() {
local VERSION="0.5.9"
local FOLDER="headphones-${VERSION}"
local FILE="v${VERSION}.tar.gz"
local URL="https://github.com/rembo10/headphones/archive/${FILE}"

_download_tgz "${FILE}" "${URL}" "${FOLDER}"
mkdir -p "${DEST}/app"
cp -vfaR "target/${FOLDER}/"* "${DEST}/app/"
# commit id of version from github
echo "6720575bd94cda8ef153d4781c06dff2813975e0" > "${DEST}/app/version.txt"
}

### BUILD ###
_build() {
  _build_headphones
  _package
}
