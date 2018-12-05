#!/bin/bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

clear
printf  "change PODINFO_UI_COLOR to green\n\n\n"
sleep 3
sed -i -e 's/value: white/value: green/g' ./workloads/podinfo-dep.yaml
sleep 1
git commit -am "PODINFO_UI_COLOR set to green"
git push origin master
printf "PODINFO_UI_COLOR set to green.\n"
printf "Deployment description should reflect that in a couple of seconds.\n"
printf "--------------------------------\n\n\n"

sleep 50

printf "Clean up - set to original state.\n"
sed -i -e 's/value: green/value: white/g' ./workloads/podinfo-dep.yaml
git commit -am "PODINFO_UI_COLOR reset to white"
git push origin master
printf "Clean up done.\n\n\n"
