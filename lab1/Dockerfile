FROM python:3.11 as build
# docker build --build-arg="IK_ARG=A test string" --no-cache . -t lab1

RUN apt update && apt upgrade -y && touch foo.txt
RUN apt install -y build-essential && \
    touch foo.txt && \
    apt remove -y build-essential
ADD pychksumbot.py /
RUN chmod +x /pychksumbot.py
ARG IK_ARG="Hello there! I am in the build stage!"
ENV IK=$IK_ARG
CMD ["/pychksumbot.py"]


# Demo of multi-stage build
FROM python:3.11 as runtime
COPY --from=build /pychksumbot.py /
ARG IK_ARG="Hello there! I am in the runtime stage!"
ENV IK=$IK_ARG
CMD ["/pychksumbot.py"]