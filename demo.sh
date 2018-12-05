#!/bin/bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

clear
echo "change PODINFO_UI_COLOR to green"
sleep 3
sed -i -e 's/value: white/value: green/g' ./workloads/podinfo-dep.yaml
sleep 1
git commit -am "PODINFO_UI_COLOR set to green"
git push origin master
echo "PODINFO_UI_COLOR set to green."
echo "Deployment description should reflect that in a couple of seconds."
echo '--------------------------------\n\n\n'

sleep 50

echo "Clean up - set to original state"
sed -i -e 's/value: green/value: white/g' ./workloads/podinfo-dep.yaml
git commit -am "PODINFO_UI_COLOR reset to white"
git push origin master
echo "Clean up done."
