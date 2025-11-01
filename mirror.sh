#!/bin/bash
echo "Cleaning up..."
rm /tmp/haskell-download
rm 01-index.tar.gz
rm 01-index.tar
rm *.json
mkdir -p package
echo "Downloading index..."
wget http://hackage.haskell.org/01-index.tar.gz
cp 01-index.tar.gz 01-index.tar.gz.copy
gzip -d 01-index.tar.gz
mv 01-index.tar.gz.copy 01-index.tar.gz
wget http://hackage.haskell.org/root.json
wget http://hackage.haskell.org/timestamp.json
wget http://hackage.haskell.org/snapshot.json
wget http://hackage.haskell.org/mirrors.json
for splitpk in `tar tf 01-index.tar.gz | cut -d/ -f 1,2`; do
	pk=`echo $splitpk | sed 's|/|-|'`
	version=`echo $splitpk | cut -d/ -f2`
	name=$pk.tar.gz
	echo $name
	if [[ "$version" != "preferred-versions" ]]; then
		if [ ! -e package/$name ]; then
			echo "Adding $name"
			echo "http://hackage.haskell.org/packages/archive/$splitpk/$name" >> /tmp/haskell-download
		else
			echo "Package found"
		fi
	fi
done
