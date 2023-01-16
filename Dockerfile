FROM ubuntu
WORKDIR APP
ADD . /APP
RUN sudo apt install nodejs 
RUN sudo apt install npm
RUN npm install
ENTRYPOINT ["node","app.js"]

