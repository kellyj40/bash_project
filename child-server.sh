#!/bin/bash

echo "HTTP/1.1 200 OK"
echo "Date: $(date)"
echo "Connection: close"
echo "Server: my_little_web_server/0.1"
echo "Refresh: $1; url=http://localhost:8888"
echo "Content-Type: text/html"
echo ""
echo "<html>"
echo "<head>"
#echo "<link rel='stylesheet' href='style.css content='text/css'>"
echo " <title>An Example Page</title>"
echo "</head>"
echo "<body>"
echo '<a href="http://localhost:8888">Home</a>'
#echo "."
echo "<div id='hello' style='color:red'> `cat childtest_file` </div>"
echo "</body>"
echo "<html>"