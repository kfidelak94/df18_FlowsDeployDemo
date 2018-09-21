#!/bin/bash

scratchAlias=$1

cp -r project_source ${scratchAlias}
cd ${scratchAlias}
sfdx force:org:create -a ${scratchAlias}_dev -v kfidelak@forcegs.com -f config/project-scratch-def.json
sfdx force:org:create -a ${scratchAlias}_int -v kfidelak@forcegs.com -f config/project-scratch-def.json
sfdx force:source:push -u ${scratchAlias}_dev
sfdx force:mdapi:deploy -d init/md_destruct -u kfidelak@forcena44.com -w 10
sfdx force:org:open -u ${scratchAlias}_dev
sfdx force:org:open -u ${scratchAlias}_int

