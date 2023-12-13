FROM python:3.11
RUN apt update && apt upgrade -y && touch foo.txt
ADD pychksumbot.py /
RUN chmod +x /pychksumbot.py
ENV IK="Hello there! You are all amazing!"
CMD ["/pychksumbot.py"]

