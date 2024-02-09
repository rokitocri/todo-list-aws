 #!/bin/ksh
 FILE=test/integration/todoApiTest.py
#/URL
URL= "$(egrep Value url_output.txt|tr -s " "|cut -f2 -d" "|grep todos|egrep -v id|uniq|sed 's/\/$//g'|uniq|sed 's/\/todos//g')"
#SED FILE
sed -i "s|BASE_URI|\"${URL}\"|g" $FILE