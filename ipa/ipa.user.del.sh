#!/bin/sh
# script : ipa.user.del.sh
# date   : 2012.07.18
# author : Yi Zhang
# version: 1.0
#
# license: GPL v2 please check COPYRIGHT.txt for details
#

# include global ipa environment file

dir=$( cd "$( dirname "$0" )" && pwd )
. $dir/ipa.env.sh

echo $pw | kinit admin  2>&1 >/dev/null
tmp=/tmp/ipa.username.$RANDOM.list
ipa user-find | grep -i "user login" | grep -v "admin" | cut -d":" -f2 | sort | uniq > $tmp
for ipausername in `cat $tmp`;do
    ipa user-del "$ipausername"
done
rm $tmp
kdestroy 2>&1 >/dev/null
