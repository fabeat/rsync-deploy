FROM alpine:latest

MAINTAINER Fabian Graßl "fabian.grassl@db-n.com"

RUN apk add --no-cache \
            bash \
            openssh-client \
            rsync

# Change default shell to bash (needed for conveniently adding an ssh key)
RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

COPY ssh-deactivate-key-checking /bin/ssh-deactivate-key-checking

ENV LC_ALL=en_US.UTF-8
