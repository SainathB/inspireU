#! /bin/bash
# check if url is reachable
ping -c 1 quotes.rest &> /dev/null
if [ $? -eq 0 ]; then
	# get quote by sending request to api
	quoteoutput=`curl -sb -H "Accept: application/json" "http://quotes.rest/qod.json?category=inspire" | grep '"quote":'`
	quoteoutput=${quoteoutput#*:}
	quoteoutput=${quoteoutput::${#quoteoutput}-1}
	#output the quote
	echo "Daily Quote"
	echo $quoteoutput
fi
