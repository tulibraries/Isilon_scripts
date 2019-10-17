NOW=$(date +"%F_%H-%M-%S")
LOGFILE="isilonapi_copy_log-$NOW.log"

exec > $LOGFILE                                                                      
exec 2>&1

# copy a directory:
curl "https://155.247.166.127:8080/namespace/ifs/data/libraryfs/media-repository/Audio/?merge=true&continue=true&overwrite=false" --verbose -k -X PUT --basic --user username:password -H 'x-isi-ifs-target-type: container' -H 'x-isi-ifs-copy-source: /namespace/ifs/data/libraryfs/media-transfer/Move_to_Media_Transfer/Audio'
curl "https://155.247.166.127:8080/namespace/ifs/data/libraryfs/media-repository/Video/?merge=true&continue=true&overwrite=false" --verbose -k -X PUT --basic --user username:password -H 'x-isi-ifs-target-type: container' -H 'x-isi-ifs-copy-source: /namespace/ifs/data/libraryfs/media-transfer/Move_to_Media_Transfer/Video'

#list target when complete
echo " "
echo "Isilon API actions finished. Recursive directory listing of target follows:"
echo " "
echo "Audio:"
curl "https://155.247.166.127:8080/namespace/ifs/data/libraryfs/media-repository/Audio/?limit=-1&detail=size,last_modified" -k -X GET --basic --user username:password -H 'x-isi-ifs-target-type: container'
echo " "
echo "Video:"
curl "https://155.247.166.127:8080/namespace/ifs/data/libraryfs/media-repository/Video?limit=-1&detail=size,last_modified" -k -X GET --basic --user username:password -H 'x-isi-ifs-target-type: container'

ls -R /media/ifs/data/libraryfs/media-repository/
