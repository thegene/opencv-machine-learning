FROM python:3.7

RUN useradd -ms /bin/bash thegene

RUN mkdir /app

ADD requirements.txt /app/

RUN chown -R thegene:thegene /app

WORKDIR /app
USER thegene

RUN pip install -r /app/requirements.txt --user

ADD . /app/

RUN export PATH="$PATH:/home/thegene"

CMD ["/bin/bash"]
