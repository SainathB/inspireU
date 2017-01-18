#! /bin/bash
# load cachequote
if [ -f /tmp/cachequote.sh ]; then
	source /tmp/cachequote.sh
fi
if [ ! -z $DATE ] && [ $DATE == `date +%Y-%m-%d` ] && [ ! -z "$QUOTE" ]; then
		echo "Daily Quote"
		echo $QUOTE
		exit 0
fi
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
	if [ -f /tmp/cachequote.sh ]; then
		rm /tmp/cachequote.sh
	fi
	touch /tmp/cachequote.sh
	chmod +x /tmp/cachequote.sh
	echo "DATE=`date +%Y-%m-%d`" >> /tmp/cachequote.sh
	echo QUOTE=`echo $quoteoutput` >> /tmp/cachequote.sh
fi
