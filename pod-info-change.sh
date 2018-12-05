#!/bin/bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

clear
echo -e "change PODINFO_UI_COLOR to green\n\n\n"
echo -e "sed -i -e 's/value: white/value: green/g' ./workloads/podinfo-dep.yaml\n\n\n"
sed -i -e 's/value: white/value: green/g' ./workloads/podinfo-dep.yaml
echo -e "git commit -am 'PODINFO_UI_COLOR set to green\n\n\n'"
git commit -am "PODINFO_UI_COLOR set to green"
echo -e "git push origin master"
git push origin master
echo -e "PODINFO_UI_COLOR set to green.\n\n\n"
echo -e "Deployment description should reflect that in a couple of seconds.\n\n\n"
echo -e "--------------------------------\n\n\n"

sleep 10

echo -e "Clean up - set to original state.\n\n\n"
sed -i -e 's/value: green/value: white/g' ./workloads/podinfo-dep.yaml
git commit -am "PODINFO_UI_COLOR reset to white"
git push origin master
echo -e "Clean up done.\n\n\n"
