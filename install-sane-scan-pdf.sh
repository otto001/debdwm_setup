#! /bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd /usr/local/lib/
sudo mkdir -p sane-scan-pdf
cd sane-scan-pdf

sudo tar -xzf $DIR/data/sane-scan-pdf/sane-scan-pdf.tar.gz
sudo chmod a+x scan scan_perpage

sudo rm -f /usr/local/bin/sane-scan-pdf
sudo ln -s $PWD/scan /usr/local/bin/sane-scan-pdf

sudo apt install -y sane netpbm ghostscript poppler-utils imagemagick unpaper util-linux tesseract-ocr  parallel units bc
