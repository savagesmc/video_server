#!/bin/bash
# Two facultativ parameters : -f <nameOfTheVideoFile> and -i <URL_Output>
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P );
sdp="rtsp://:8554/flux";
while getopts "f:i:" OPTNAME
do
   case $OPTNAME in
      f) name=$OPTARG;;
      i) sdp=$OPTARG;;
   esac
done
if [ -z $name ]; then
   echo "Counldn't open file - aborting."
   exit 255
fi
sout="#transcode{vb=0,scale=0,acodec=mpga,ab=128,channels=2,samplerate=44100}:rtp{sdp="$sdp"}";
su vlcuser -c "vlc -vvv $name --sout '$sout'"
