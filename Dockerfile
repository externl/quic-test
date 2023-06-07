FROM ubuntu:22.04 as base

RUN echo "Package: *\nPin: origin packages.microsoft.com\nPin-Priority: 1001" > /etc/apt/preferences.d/dotnet

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
    curl \
    build-essential \
    ca-certificates \
    && update-ca-certificates

RUN curl -sSL https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -o packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb

RUN apt-get update && apt-get install -y --no-install-recommends libmsquic dotnet-sdk-7.0

COPY . /app

WORKDIR /app

RUN dotnet build

CMD ["dotnet", "run"]


FROM base as bad

FROM base as good

RUN  curl -sSL http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.19_amd64.deb -o libssl1.1_1.1.1f-1ubuntu2.19_amd64.deb \
    && dpkg -i libssl1.1_1.1.1f-1ubuntu2.19_amd64.deb \
    && rm libssl1.1_1.1.1f-1ubuntu2.19_amd64.deb
