# TS Academy Assignment – Assignment 2

Diagnostic CLI Tool

A lightweight, containerized Linux diagnostic utility built with Bash and Docker. This tool provides essential system diagnostics, network connectivity checks, and disk usage information through a simple command-line interface.

Features
System Information (system) — Displays Linux system information, uptime, kernel version, OS distribution, and memory usage.
Network Connectivity (network <host>) — Checks network connectivity to a target host using ping.
Disk Usage (disk) — Displays current disk space usage.
Help (help) — Displays available commands and usage instructions.
Docker Support — Runs diagnostics inside a containerized environment.
Exit Codes — Returns specific exit codes to indicate success, operational failures, or invalid commands.
Prerequisites

Ensure the following tools are installed:

Linux environment or a compatible Bash environment
Bash shell
Docker
Docker Compose (optional, if using docker compose)
ping utility, available in the execution environment
Project Structure
.
├── app/
│   └── diagnostic.sh
├── test.sh
├── Dockerfile
├── docker-compose.yml
└── README.md


Note: This structure assumes your project contains the files listed above.

Usage
1. Run Locally

First, make the diagnostic script executable:

chmod +x app/diagnostic.sh

Available Commands

Display help

./app/diagnostic.sh help


View system information

./app/diagnostic.sh system


View disk usage

./app/diagnostic.sh disk


Check network connectivity

./app/diagnostic.sh network 8.8.8.8


Replace 8.8.8.8 with the IP address or hostname you want to test.

2. Build the Docker Image

Build the Docker image from the project directory:

docker build -t diagnostic-tool .

3. Run Commands with Docker

Run system diagnostics

docker run --rm diagnostic-tool system


Check disk usage

docker run --rm diagnostic-tool disk


Test network connectivity

docker run --rm diagnostic-tool network 1.1.1.1


Display help

docker run --rm diagnostic-tool help


The --rm flag automatically removes the container after the command finishes.

4. Run Commands with Docker Compose

If your project includes a configured docker-compose.yml file, you can run the diagnostics using Docker Compose.

Run system diagnostics

docker compose run --rm diagnostic system


Check disk usage

docker compose run --rm diagnostic disk


Replace diagnostic with the service name defined in your Compose configuration if it differs.

Exit Codes

The tool returns the following exit codes based on execution status:

Exit Code	Description
0	Success
1	Operational or runtime failure, such as an unreachable host
2	Invalid command or missing required argument

These exit codes can be used in shell scripts, automated tests, and CI/CD pipelines to determine whether a diagnostic operation succeeded.

Testing

Run the test suite to verify the script's behavior and exit codes.

Make the test script executable:

chmod +x test.sh


Run the tests:

./test.sh


Review the test output to confirm that the expected commands and exit codes behave correctly.

Technologies Used
Bash — Implements the diagnostic commands and CLI logic.
Linux — Provides the system environment and diagnostic utilities.
Docker — Packages and runs the tool in a container.
Docker Compose — Simplifies running the container through a configured service.
Shell scripting tests — Validate command behavior and exit codes.
Use Cases
Quick Linux system diagnostics
Basic network connectivity troubleshooting
Disk space monitoring
Learning Bash scripting and command-line interface design
Practicing Docker containerization and automated testing
License

No license has been specified yet. Add a license if you intend to distribute or share this project publicly.