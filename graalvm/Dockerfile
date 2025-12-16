# ===== Stage with GraalVM JDK =====
FROM oraclelinux:9-slim AS graalvm-base
WORKDIR /opt

RUN microdnf -y install \
      tar gzip findutils \
      gcc gcc-c++ \
      glibc-devel zlib-devel \
      glibc-langpack-en \
    && microdnf clean all

COPY graalvm-jdk-17.0.17_linux-x64_bin.tar.gz /tmp/jdk17graalvm.tar.gz

RUN mkdir -p /opt/java && \
    tar -xzf /tmp/jdk17graalvm.tar.gz -C /opt/java && \
    ln -s /opt/java/$(ls /opt/java | grep -E '^graalvm|^jdk' | head -n 1) /opt/java/graalvm && \
    rm -f /tmp/jdk17graalvm.tar.gz

ENV JAVA_HOME=/opt/java/graalvm
ENV PATH="$JAVA_HOME/bin:$PATH"
ENV LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

RUN native-image --version || true

# ===== Build (JDK) =====

FROM graalvm-base AS build-jar
WORKDIR /app
COPY . .
RUN chmod +x mvnw && ./mvnw -DskipTests package

RUN mkdir -p /out && cp target/*.jar /out/order.jar

# ===== Build (Native) =====

FROM graalvm-base AS build-native

WORKDIR /app
COPY . .
RUN chmod +x mvnw && ./mvnw -Pnative -DskipTests native:compile

RUN mkdir -p /out && cp target/graalvm /out/order

# ===== Runtime (JDK) =====

FROM oraclelinux:9-slim AS jdk
RUN microdnf -y install glibc-langpack-en procps-ng && microdnf clean all
ENV LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

COPY --from=graalvm-base /opt/java/graalvm /opt/java/graalvm
ENV JAVA_HOME=/opt/java/graalvm
ENV PATH="$JAVA_HOME/bin:$PATH"

WORKDIR /app
COPY --from=build-jar /out/order.jar /app/order.jar
ENV PORT=8080
EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/order.jar"]

# ===== Runtime (Native) =====
FROM oraclelinux:9-slim AS native
RUN microdnf -y install glibc-langpack-en procps-ng && microdnf clean all
ENV LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

WORKDIR /app
COPY --from=build-native /out/order /app/order
ENV PORT=8080
EXPOSE 8080

ENTRYPOINT ["/app/order"]