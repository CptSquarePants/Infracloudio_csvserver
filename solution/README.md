THE CSVSERVER ASSIGNMENT [Repository: https://github.com/infracloudio/csvserver.git]

Namaste, Hello, Hola, Bonjour, Konnichiwa, Guten Tag Everyone!

Instructions [Part I]

1. Install Docker and docker-compose on your machine and run following commands
------------------------------------------------------------------------------------------
docker pull infracloudio/csvserver:latest
docker pull prom/prometheus:v2.22.0
------------------------------------------------------------------------------------------

2. Bash script gencsv.sh | Output File: inputFile
------------------------------------------------------------------------------------------
#!/usr/bin/env bash
#Purpose - Bash script to generate comma separated values with index and a three digit random number
#Author - ShashanK (https://github.com/CptSquarePants)

if [[ $1 ]] 
then
	for ((i=0; i<$1; i++));
		do
			echo "$i, ${RANDOM:0:3}" >> inputFile;
		done
else
	for ((i=0; i<10; i++));
		do
			echo "$i, ${RANDOM:0:3}" >> inputFile;
		done
fi
------------------------------------------------------------------------------------------

3. Run docker container | Image ID: 8cb989ef80b5
------------------------------------------------------------------------------------------
docker run [docker_image]
docker ps -a

Possible Error: error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory
Reason        : We need to specify inputFile location while running docker image, please note for Host: inputFile and for Container: inputdata
Solution      : Please include the following command while running docker image

-v [HostPath]:/csvserver/inputdata
------------------------------------------------------------------------------------------

4. Set the environment variable CSVSERVER_BORDER to have value Orange
------------------------------------------------------------------------------------------
-e CSVSERVER_BORDER=Orange
------------------------------------------------------------------------------------------

5. Run docker image using below single command
------------------------------------------------------------------------------------------
docker run -e CSVSERVER_BORDER=Orange -d -p 9393:9300 -v [HostPath]:/csvserver/inputdata 8cb989ef80b5
------------------------------------------------------------------------------------------

6. Check Output
------------------------------------------------------------------------------------------
Welcome to the CSV Server
Index	Value
0	    312
1	    184
2	    173
3	    318
4	    307
5	    326
6	    149
7	    458
8	    898
9	    287
------------------------------------------------------------------------------------------