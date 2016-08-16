#command parameters
DIRECTORY=$1
EXTENSION=$2

a=1
cd "$DIRECTORY" || exit
for i in *.$EXTENSION; do
    new=$(printf "%05d.$EXTENSION" ${a})
    echo "${i}"
    mv "${i}" "${new}"
    let a=a+1
done
