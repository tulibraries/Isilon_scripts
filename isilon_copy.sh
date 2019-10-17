#!/bin/bash

# curl "https://155.247.166.127:8080/platform/?describe&list&all" -k --basic --user username:password --verbose
# curl "https://155.247.166.127:8080/platform/1/protocols/nfs/exports" -k --basic --user username:password --verbose
# curl "https://155.247.166.127:8080/platform/1/protocols/nfs/exports" -k -X PUT --basic --user username:password --verbose
# curl "https://155.247.166.127:8080/namespace/ifs/data/libraryfs/test-access/testapi" -k --user username:password 
# curl "https://155.247.166.127:8080/namespace/ifs/data/libraryfs/test-repository/?detail=name,type" -k --user username:password 
# curl "https://155.247.166.127:8080/namespace/ifs/data/libraryfs/test-access/testapi" -k -X PUT --basic --user username:password --verbose -H 'x-isi-ifs-target-type: container' -H 'x-isi-ifs-copy-source: /namespace/ifs/data/libraryfs/test-repository'
# curl "https://155.247.166.127:8080/namespace/ifs/data/libraryfs/test-access/testapi?merge=true&continue=true" -k -X PUT --basic --user username:password -H 'x-isi-ifs-target-type: container' -H 'x-isi-ifs-copy-source: /namespace/ifs/data/libraryfs/test-repository'


NOW=$(date +"%F_%H-%M-%S")
LOGFILE="isilonapi_copy_log-$NOW.log"

exec > $LOGFILE                                                                      
exec 2>&1

curl "https://155.247.166.127:8080/namespace/ifs/data/libraryfs/test-access/testapi?merge=true&continue=true" --verbose -k -X PUT --basic --user username:password -H 'x-isi-ifs-target-type: container' -H 'x-isi-ifs-copy-source: /namespace/ifs/data/libraryfs/media-transfer/Move_to_Media_Transfer/Audio'
