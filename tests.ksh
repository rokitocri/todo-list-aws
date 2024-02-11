#!/bin/ksh
FILE=test/integration/todoApiTest.py
#URL
URL="$(egrep Value url_output.txt)"
val=`echo $?`
if [ $val -ne 0 ] ; then
        exit 0
else
        URL="$(egrep Value url_output.txt|tr -s " "|cut -f2 -d" "|grep todos|egrep -v id|uniq|sed 's/\/$//g'|uniq|sed 's/\/todos//g')"
        # SED FILE
        A=`egrep -ia ^BASE_URL test/integration/todoApiTest.py`
        sed -i "s|${A}|BASE_URL = \"${URL}\"|g" $FILE
        exit 0
fi