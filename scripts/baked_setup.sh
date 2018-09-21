#!/bin/bash

scratchAlias=$1
pkgName=$2

cp -r project_source ${scratchAlias}
cd ${scratchAlias}
sfdx force:org:create -a ${scratchAlias}_dev -v kfidelak@forcegs.com -f config/project-scratch-def.json
sfdx force:org:create -a ${scratchAlias}_int -v kfidelak@forcegs.com -f config/project-scratch-def.json
sfdx force:source:push -u ${scratchAlias}_dev

sfdx force:package:create -n ${pkgName} -t Unlocked -r force-app/ -e -v kfidelak@forcegs.com
sfdx force:package:version:create -d force-app/ -p ${pkgName} -w 10 -v kfidelak@forcegs.com -x

cp init/newflow/HelloWorld.flow-meta.xml force-app/main/default/flows

sfdx force:package:version:create -d force-app/ -p ${pkgName} -w 10 -v kfidelak@forcegs.com -x

sfdx force:package:version:promote -p ${pkgName}@0.1.0-1 -n -v kfidelak@forcegs.com

