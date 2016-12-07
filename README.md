create a ``myalignname.txt`` file in ``/path/to/localdir``
```
GID=$(getent group <groupname> | cut -d: -f3)
docker run -u $UID:$GID -d -v /path/to/localdir:/data -e ALIGN=myalignname -e NSLOTS=16 --name prog-cact lepbase/progressivecactus
```
