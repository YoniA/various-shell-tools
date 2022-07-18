#!/bin/bash

DISCOUNT_THRESHOLD=30

echo -e "More than $DISCOUNT_THRESHOLD% discount detected on the following books:\n" >> mail.txt
count=0
while read url; do
		
	# remove book recommendation section (may also contain discounts)
	curl $url > page_content
	line_num=$(grep -n "detail-page-carousel-wrap" page_content | awk -F: '{print $1}')
	sed -i "$line_num,$ d" page_content

	tmp=$(grep "[0-9][0-9]%.*off" page_content)
	discount=$(echo $tmp | cut -c1-2)
	book_name=$(echo $url | sed 's/.*www\.bookdepository\.com\/\(.*\)\/.*/\1/')

	echo $book_name, $discount

	if [[ "$discount" -gt "$DISCOUNT_THRESHOLD" ]]; then
		echo "* $book_name ($discount%)" >> mail.txt
		echo "* Check it out at: $url" >> mail.txt
		echo "===================================" >> mail.txt
		((count++))
	fi	
done < whishlist-urls.txt

if (( $count > 1 )); then
	echo $count
	# send email
	curl --ssl-reqd \
			--url 'smtps://smtp.gmail.com:465' \
			--user 'foo.bar@example.com:Fak!Pa123' \
			--mail-from 'foo.bar@example.com' \
			--mail-rcpt 'baz@example.com' \
fi

echo "================="
echo "$count"

# clear mail body, except headers
sed -i '6,$d' mail.txt
