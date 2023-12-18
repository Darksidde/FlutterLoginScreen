FROM ubuntu:latest

# Flutter ve bağımlılıklarının kurulumu
RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip \
    xz-utils \
    libglu1-mesa

# Flutter yükleme
RUN git clone https://github.com/flutter/flutter.git -b stable --depth 1 /flutter
ENV PATH "$PATH:/flutter/bin"

# Flutter kullanarak projeyi build etmek
COPY . /app
WORKDIR /app
RUN flutter pub get
RUN flutter build apk

CMD ["flutter", "run", "--release"]
