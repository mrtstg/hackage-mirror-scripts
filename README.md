# hackage-mirror-scripts

Scripts for creating Hackage mirror for further hosting (using nginx, for example)

# How to use

Put scripts in directory where you want to create mirror repo

```bash
apt-get install parallel wget # or install GNU parallel and wget on your system
bash mirror.sh # will create /tmp/haskell-download
bash download-all.sh
```

# Updating repo

If you want to actualize index and files, run scripts again and if there is will be
new packages, they will be included. **If archive with following name and version will exist,
package download will be skipped.**
