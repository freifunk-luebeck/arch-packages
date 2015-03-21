#!/bin/bash

for d in */; do
  pushd $d
  makepkg -f --sign && cp -v *.pkg.tar.xz* ../repo/ || break
  popd
done

cd repo

repo-add ffhl.db.tar.gz *.xz --verify --sign

rsync -raP --delete . krtek:public_html/ffhl-gw/
