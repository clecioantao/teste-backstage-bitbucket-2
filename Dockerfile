FROM python:3.8.3-slim-buster
# Install hadolint
RUN apt-get update -y && \
    apt-get install -y wget && \
    wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 && \
    chmod +x /bin/hadolint && \
    apt-get remove -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /
EXPOSE 5000
COPY . .
RUN pip install -r requirements.txt && chmod +x /entrypoint
ENTRYPOINT ["/bin/bash", "-c", "/entrypoint"]
