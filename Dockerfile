FROM ubuntu:latest AS build 
RUN apt update && apt install -y python3
RUN apt install -y python3-pip 

WORKDIR /app
COPY ./scanner /app

ENV debug=null
ENV SECRET_KEY=null


RUN pip install -r requirement.txt
EXPOSE 80

# magic starts here ==> MultiStage Build
FROM gcr.io/distroless/python3

COPY --from=build /app /app
WORKDIR /app
COPY --from=build /usr/local/lib/python3.10/dist-packages /usr/local/lib/python3.10/dist-packages
ENV PYTHONPATH=/usr/local/lib/python3.10/dist-packages

CMD ["manage.py", "runserver", "0.0.0.0:80"]