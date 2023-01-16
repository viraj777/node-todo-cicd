FROM ubuntu
WORKDIR app
ADD . /app
RUN apt install nodejs 
RUN apt install npm
RUN npm install
ENTRYPOINT ["node","app.js"]

