#!/usr/bin/env bash
node server.js 2>&1 | 
xargs -I @ printf '%s | @\n' '$(TZ=UTC date +"%F %T %Z")' | 
xargs -d '\n' -I % sh -c 'if [ -e logstream_enabled ]; 
                          then curl -H "Content-Type: text/plain" -X POST -d "%" http://dockerlogstream.azurewebsites.net/ -o /dev/null 2>/dev/null; 
                          printf "%\n"; 
                          else printf "%\n"; 
                          fi'