Hey Everyone! My name is Lev Meshorer. And this is Foodtrucks project:)

What I've done in this project?

I've Built the Dockerfile (Dockerized the webapp)
I Wrote a nginx.conf file to handle with the webapp
I've Built a docker-compose in order to make the three services work with each other, Webapp image, elasticsearch and nginx.
In order to deploy the webapp, please enter the following command in order to build the webapp docker image:

docker build -t food:1.0 .

after the dockerfile has been built lets deploy the docker-compose with the command:

docker-compose up -d

Awesome! Everything should be up and running in the address http://localhost:8080

for any problem in the project, feel free to contact me at any time! via Levmeshorer16@gmail.com