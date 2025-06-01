FROM gcc:14.2-bookworm

ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget cmake git autoconf time \
		libboost-filesystem-dev \
        libboost-iostreams-dev \
        libboost-regex-dev \
        libboost-system-dev \
        libboost-random-dev \
        libboost-dev \
		flex bison

# Copy Knor
COPY knor /knor
WORKDIR /knor

# Build Knor
RUN mkdir -p build && \
    cmake -B build -DCMAKE_BUILD_TYPE=Release . && \
    cmake --build build --target knor --config Release -j 4 && \
    cp build/knor /usr/local/bin/knor

# Copy the dispatcher script
COPY main.sh /main.sh
RUN chmod +x /main.sh

# Use it as the entrypoint
ENTRYPOINT ["/main.sh"]
