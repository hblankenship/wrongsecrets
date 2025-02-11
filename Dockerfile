FROM ubuntu:20.04

RUN useradd -m -u 2000 wrongsecrets

RUN apt update && apt install -y gdb gcc

# Challenge52
COPY secret_challenge52.c /home/wrongsecrets/

RUN gcc /home/wrongsecrets/secret_challenge52.c -o /home/wrongsecrets/secret_challenge52

RUN chmod 111 /home/wrongsecrets/secret_challenge52 && chown wrongsecrets:wrongsecrets /home/wrongsecrets/secret_challenge52

USER wrongsecrets

CMD ["/home/wrongsecrets/secret_challenge52 &"]
