#!/bin/bash
for i in `find -name "*.sh"`; do if [ ! -x $i ]; then echo $i; fi; done

echo "will make them exec in 10 sec"
echo
echo "CTRL+C to cancel"
sleep 10

for i in `find -name "*.sh"`; do if [ ! -x $i ]; then chmod a+x $i; fi; done
