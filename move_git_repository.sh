#!/bin/bash

### 
argc=$#
script_fname=$0
script_name=$(basename ${script_fname})

### スクリプトディレクトリの取得
scirpt_dir=$(cd $(dirname ${script_fname}); pwd)

### 
if [ ${argc} -ne 2 ]; then
  echo "Usage : ${script_fname} <src git repository uri> <dst git repository uri>"
  exit 1
else
  #
  src_uri=$1
  dst_uri=$2
  #
  src_dir=`basename ${src_uri}`
  src_dir=${src_dir%.*}
  dst_dir=`basename ${dst_uri}`
  dst_dir=${dst_dir%.*}
fi

### gitリポジトリをmirrorオプション付きでclone
git clone --mirror ${src_rui}
cd ${src_dir}
### git-lfsのファイルをすべて取得
git lfs fetch --all
### gitリポジトリをmirrorオプション付きでpush
git push --mirror ${dst_uri}
### git-lfsのファイルをすべてpush
git lfs push --all ${dst_uri}
###
exit 0
