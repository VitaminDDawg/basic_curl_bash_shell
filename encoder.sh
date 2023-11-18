#!/bin/sh

# Takes as its parameters an input filename and an output filename, thus:
#
# encode inputfilename outputfilename

if [ "$2" = "" ]
then
  echo encode wants an input filename and an output filename 1>&2
  exit 1
fi

if [ -e $2 ]
then
  echo file $2 already exists 1>&2
  exit 1
fi

echo '#!/bin/sh' > $2
echo >> $2
echo 'uudecode -o /dev/stdout <<EOD | zcat | /bin/sh' >> $2
gzip -c $1 | uuencode -m /dev/stdout >> $2
echo EOD >> $2

chmod 755 $2
