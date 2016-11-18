#! /bin/bash
# get quote by sending request to api
quoteoutput=`curl -sb -H "Accept: application/json" "http://quotes.rest/qod.json?category=inspire" | grep '"quote":'`
quoteoutput=${quoteoutput#*:}
quoteoutput=${quoteoutput::${#quoteoutput}-1}
# output the quote
echo "Daily Quote"
echo $quoteoutput
