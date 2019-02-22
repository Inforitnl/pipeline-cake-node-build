FROM ubuntu:18.04

ENV MONO_VERSION 5.4.1.6

# install base software
RUN apt-get update \
    && apt-get install -y curl apt-transport-https gnupg wget dpkg 

# adding sources and updating
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian wheezy/snapshots/$MONO_VERSION main" > /etc/apt/sources.list.d/mono-official.list \  
    && apt-get update

# install mono
RUN apt-get install -y mono-runtime-sgen mono-runtime binutils curl mono-devel ca-certificates-mono fsharp mono-vbnc nuget referenceassemblies-pcl

# install dotnetcore
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt-get update -y \
    && apt-get install -y dotnet-sdk-2.2

# install dos2unix
RUN apt-get install -y dos2unix

# install node
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

# install dotnet cake v3
RUN dotnet tool install -g Cake.Tool --version 0.30.0

# cleanup
RUN rm -rf /var/lib/apt/lists/* /tmp/* packages-microsoft-prod.deb

# Set workdir alias
WORKDIR /api

# # Fix .netcore paths if dotnet is installed
RUN mkdir -p ~/scripts
ADD scripts /scripts
RUN echo "source /scripts/dotnetcore.sh" >> ~/.bashrc

# add entrypoint and run
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/bin/bash","-i", "/entrypoint.sh"]
