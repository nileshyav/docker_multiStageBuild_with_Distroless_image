
FROM ubuntu:latest AS build 
RUN apt update && apt install -y python3
RUN apt install -y python3-pip 

WORKDIR /app
COPY ./scanner /app

ENV debug=null
ENV SECRET_KEY=null

RUN pip install -r requirement.txt
EXPOSE 80




CMD ["python3","manage.py", "runserver", "0.0.0.0:80"]