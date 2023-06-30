FROM manjarolinux/base
ARG TAGS
WORKDIR /usr/local/bin
RUN pacman -Syu && pacman -Syu --noconfirm ansible && pacman -Syu --noconfirm ansible-core && pacman -Syu --noconfirm git 
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
