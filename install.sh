#!/bin/bash
## Author: Dang Thanh Phat
## Email: thanhphatit95@gmail.com
## Web/blogs: www.itblognote.com
##      sudo curl -o- https://raw.githubusercontent.com/thanhphatit/gemini-ai/main/install.sh | /bin/bash
##      sudo wget -q https://raw.githubusercontent.com/thanhphatit/gemini-ai/main/install.sh -O - | /bin/bash

###### GLOBAL VARIABLES
BIN_NAME="gemini-ai"
REPO_OWNER="thanhphatit"
GIT_BRANCH="main"
GIT_PATH_DOWN_FILE="${BIN_NAME}.deb"
REPO_RELEASE_NAME="${BIN_NAME}"
TMP_INSTALL_ROOT=$(mktemp -dt ${BIN_NAME}-install-XXXXXX)
TMP_INSTALL_FILE="${TMP_INSTALL_ROOT}/${GIT_PATH_DOWN_FILE}"

###### FUNCTIONS
function download_file(){
    local _DOWNLOAD_URL="https://raw.githubusercontent.com/${REPO_OWNER}/${REPO_RELEASE_NAME}/${GIT_BRANCH}/${GIT_PATH_DOWN_FILE}"

    if [[ $(command -v curl) ]];then
        curl -SsL "${_DOWNLOAD_URL}" -o "${TMP_INSTALL_FILE}"
    else
        wget -q -O "${TMP_INSTALL_FILE}" "${_DOWNLOAD_URL}"
    fi    
}

###### MAIN
function main(){
    download_file

    if [[ -f ${TMP_INSTALL_FILE} ]];then
        chmod 755 ${TMP_INSTALL_FILE}
        apt install ${TMP_INSTALL_FILE}
    fi

    if [[ -d ${TMP_INSTALL_ROOT} ]];then
        rm -rf ${TMP_INSTALL_ROOT}
    fi
}

###### START
main "${@}"

exit 0