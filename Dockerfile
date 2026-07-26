# Stage 1: static FFmpeg
FROM mwader/static-ffmpeg:7.1 AS ffmpeg

# Stage 2: official n8n
FROM n8nio/n8n:latest

USER root

# Copy only the binaries we need
COPY --from=ffmpeg /ffmpeg /usr/local/bin/ffmpeg
COPY --from=ffmpeg /ffprobe /usr/local/bin/ffprobe

# Make sure they are executable
RUN chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe

USER node
