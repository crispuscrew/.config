echo "[INF] selinux disable..."

sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
if [ $? -ne 0 ]; then
    echo "[ERR] selinux disabled finished with error, please repair it after script completion"
    exit -1
fi
echo "[INF] selinux success disabled"