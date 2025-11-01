FILENAME=`echo $1 | rev | cut -d/ -f 1 | rev`
wget $1 -O package/$FILENAME
