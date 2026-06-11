#! /usr/bin/env -S bash -l

set -e

source set-container-envars
mkdir --parents $LOGFILES
export LOGFILE=$LOGFILES/fedora-installs.log
rm --force $LOGFILE

echo "..Upgrading"
sudo dnf --quiet --assumeyes upgrade \
  >> $LOGFILE 2>&1

echo "..Enabling COPRs"
sudo dnf --quiet --assumeyes copr enable iucar/cran \
  >> $LOGFILE 2>&1
sudo dnf --quiet --assumeyes copr enable iucar/rstudio \
  >> $LOGFILE 2>&1


echo "..Installing"
sudo dnf --quiet --assumeyes install \
  R-CoprManager \
  R-CRAN-GA \
  R-CRAN-Rdpack \
  R-CRAN-audio \
  R-CRAN-btw \
  R-CRAN-data.table \
  R-CRAN-devtools \
  R-CRAN-fractional \
  R-CRAN-monitoR \
  R-CRAN-music \
  R-CRAN-NatureSounds \
  R-CRAN-numbers \
  R-CRAN-phonTools \
  R-CRAN-seewave \
  R-CRAN-shinychat \
  R-CRAN-signal \
  R-CRAN-soundecology \
  R-CRAN-soundgen \
  R-CRAN-tinytex \
  R-CRAN-tuneR \
  R-CRAN-warbleR \
  R-devel \
  curl \
  ffmpeg-devel \
  firefox \
  gh \
  libcurl-devel \
  libsndfile-devel \
  lshw \
  neovim \
  rstudio-desktop \
  rstudio-server \
  texlive-bibtools \
  zstd \
  >> $LOGFILE 2>&1

sudo systemctl enable --now rstudio-server.service

echo "..Installing ROpenSci media utilities"
sudo Rscript -e "install.packages(c('av', 'fluidsynth'), repos ='https://cloud.r-project.org/')" \
  >> $LOGFILE 2>&1

echo "..Copying R / btw settings files to $HOME"
cp Rprofile $HOME/.Rprofile
cp Renviron $HOME/.Renviron
cp btw.md $HOME/btw.md

echo "..Exporting RStudio Desktop"
distrobox-export --app \
  /usr/share/applications/rstudio.desktop
