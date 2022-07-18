# Whishlist discount sniffer

A shell script to automate the process of looking for book wishlist discount.
The script sniffs the Book Depository website for books from my wishlist that are offered at
more than 30% discount. If such books are detected, and email is sent with the name and links to the books.

When added to the `crontab` file, it will sniff the the website automatically add constant times, as configured.


## dependencies
None.
The script uses standard tools such as `sed`, `cut`, `curl`, which usually come by default with the distribution (tested on lubuntu 20.04).


## How to use

1. The `whishlist-urls.txt` file contains the urls of books. Replace its content with your own book urls (each url in a separate line).
2. The `discount-sniffer.sh` file is the shell script that does all the work. In it there is a shell variable called `$DISCOUNT_THRESHOLD` which is set by default
to 30 (find offers with more than 30% discount). You can set it to a value of your choice. 
3. In the same file, replce the mail address and credentials with your own (removed my actual credentials with fake examples).
4. the `mail.txt` file contains the headers of the mail. Replace it with your own headers (`From`, `To`, etc.). The main script writes offers to this file, and cleans it 
after an email is sent (leaving only the headers in place).
5. (optional) If you want to automate the script invocation, add it to your `crontab` file, with your own time preferences.



## More details

For more details about the project, read the following [blogpost](https://yonia.github.io/dev-blog/linux/shell/script/curl/sed/grep/2021/08/29/discount-sniffer.html).
