#!/bin/sh

while [ true ] 
do
	curl -s -o /dev/null -w "Response_code: %{http_code}, Response_time: %{time_total}\n" http://www.google.com;

	sleep 5
done;
