### HEADPHONES ###
_build_headphones() {
local BRANCH="master"
local FOLDER="app"
local URL="https://github.com/rembo10/headphones.git"

_download_git "${BRANCH}" "${FOLDER}" "${URL}"
mkdir -p "${DEST}/app"
cp -avR "target/${FOLDER}"/* "${DEST}/app/"
}

### BUILD ###
_build() {
  _build_headphones
  _package
}
