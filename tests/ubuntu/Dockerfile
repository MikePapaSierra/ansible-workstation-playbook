FROM ubuntu:rolling
ARG TAGS
WORKDIR /usr/local/bin
RUN pacman -Syu && pacman -Syu --noconfirm ansible && pacman -Syu --noconfirm ansible-core && pacman -Syu --noconfirm git 
COPY . .
RUN ansible-galaxy install -r requirements.yml
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
