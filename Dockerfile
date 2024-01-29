FROM rjsheperd/clojure-bb-bun:latest

# Install dependencies
RUN apt-get update
RUN apt-get install gpg curl bzip2 xz-utils nodejs -y

# Add Chrome channel
RUN curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor | tee /usr/share/keyrings/google-chrome.gpg > /dev/null
RUN echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | tee /etc/apt/sources.list.d/google-chrome.list

# Install Chrome Dependencies
RUN apt-get update
RUN apt-get -y install libxpm4 libxrender1 libgtk2.0-0 libnss3 libgconf-2-4
RUN apt-get -y install xvfb gtk2-engines-pixbuf
RUN apt-get -y install xfonts-cyrillic xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable

# Install Chrome
RUN apt-get -y install google-chrome-stable --no-install-recommends
RUN rm -rf /var/lib/apt/lists/*
