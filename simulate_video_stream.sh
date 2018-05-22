#!/bin/bash
# Two facultativ parameters : -f <nameOfTheVideoFile> and -i <URL_Output>
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P );
sdp="rtsp://:8554/flux";
loop=""
bandwidth=0
while getopts "f:i:b:l" OPTNAME
do
   case $OPTNAME in
      f) name=$OPTARG;;
      i) sdp=$OPTARG;;
      l) loop="--loop";;
      b) bandwidth=$OPTARG;;
   esac
done
if [ -z $name ]; then
   echo "Counldn't open file - aborting."
   exit 255
fi
sout="#transcode{vb=$bandwidth,scale=0,acodec=mpga,ab=128,channels=2,samplerate=44100}:rtp{sdp="$sdp"}";
su vlcuser -c "cvlc -q -vvv $name $loop --sout '$sout'"
