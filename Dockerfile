# Base image
FROM debian:11

# Update Package and Install Python 3.9+
RUN apt-get update && apt-get install -y python3.9

# Alias for python3.9
RUN ln -sf /usr/bin/python3.9 /usr/bin/python

# Install Linux packages for debugging and basic operation
RUN apt-get install -y curl nano htop wget python3-pip net-tools

# Set workdir
WORKDIR /app

# Clone the application code from GitHub
RUN git clone https://github.com/Shollykit/assessment.git

# Install the application's dependencies
WORKDIR /app/assessment
RUN pip3 install -r requirements.txt

# Make the artifact available outside the container
VOLUME /app/assessment/file_lines.txt

# Set the command to run the application
CMD ["python", "script.py", "--lines", "10"]