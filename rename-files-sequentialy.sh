#command parameters
EXTENSION=$1

a=1
for i in *.$EXTENSION; do
    new=$(printf "%05d.$EXTENSION" ${a})
    echo ${i}
    mv ${i} ${new}
    let a=a+1
done
