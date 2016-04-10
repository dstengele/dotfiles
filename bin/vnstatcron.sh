if [ -x /usr/local/Cellar/vnstat/1.11/bin/vnstat ] && [ `ls /usr/local/var/db/vnstat/ | wc -l` -ge 1 ];
    then /usr/local/Cellar/vnstat/1.11/bin/vnstat -u;
fi

/usr/local/bin/vnstati --locale en_US.UTF-8  -s -i en0+en1 -o /Users/dennis/.vnstat/vnstat.png
