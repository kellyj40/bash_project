#!/bin/bash

echo "HTTP/1.1 200 OK"
echo "Date: $(date)"
echo "Connection: close"
echo "Server: my_little_web_server/0.1"
echo "Refresh: .5; url=http://localhost:$1"
echo "Content-Type: text/html"
echo ""
echo "<html>"
echo "<head>"
echo " <title>An Example Page</title>"
echo "</head>"
echo "<body>"
echo "Loading..."
echo "</body>"
echo "<html>"
