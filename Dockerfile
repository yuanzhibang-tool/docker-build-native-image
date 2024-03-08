FROM ubuntu:22.04
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y curl unzip zip git build-essential libz-dev zlib1g-dev maven libxml2-utils
RUN curl -s "https://get.sdkman.io" | bash
SHELL ["/bin/bash", "-c"]
RUN source "/root/.sdkman/bin/sdkman-init.sh" && sdk install java 21.0.2-graal && sdk use java 21.0.2-graal
COPY build-in-docker.sh /scripts/build-in-docker.sh
ENTRYPOINT [ "/bin/bash", "-c", "./scripts/build-in-docker.sh"]