# Start with a lightweight Linux base
FROM debian:bullseye-slim

# Install the specific tools the bash script needs AND dos2unix
RUN apt-get update && apt-get install -y fortune cowsay netcat-openbsd dos2unix && rm -rf /var/lib/apt/lists/*

# Tell the container where to find the 'cowsay' program
ENV PATH="$PATH:/usr/games"

# Set up our working directory
WORKDIR /app

# Copy the script
COPY wisecow.sh .

# Convert line endings AND make executable
RUN dos2unix wisecow.sh && chmod +x wisecow.sh

# Expose the port the app runs on
EXPOSE 4499

# Start the app
CMD ["./wisecow.sh"]
