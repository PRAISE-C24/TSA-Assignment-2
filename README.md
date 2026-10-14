# TS Academy Assignment – Assignment 2

## Diagnostic CLI Tool

A lightweight, containerized Linux diagnostic utility built with Bash and Docker. This tool provides essential system diagnostics, network connectivity checks, and disk usage information through a simple command-line interface.

## Features

- **System Information (`system`)** — Displays Linux system information, including uptime, kernel version, operating system distribution, and memory usage.
- **Network Connectivity (`network <host>`)** — Checks network connectivity to a specified hostname or IP address using `ping`.
- **Disk Usage (`disk`)** — Displays current filesystem and disk space utilization.
- **Help (`help`)** — Displays available commands and usage instructions.
- **Docker Support** — Runs diagnostic commands inside a containerized environment.
- **Exit Codes** — Uses specific exit codes to indicate successful execution, operational failures, and invalid commands or arguments.
- **Automated Testing** — Includes a test script to validate command behavior and exit codes.

## Prerequisites

Ensure the following tools are available:

- Linux environment or a compatible Bash environment
- Bash shell
- Docker Engine
- Docker Compose (optional, if using Compose)
- `ping` utility, available inside the execution environment where network checks run

## Project Structure

```text
.
├── app/
│   └── diagnostic.sh       # Main diagnostic CLI application
├── test.sh                 # Automated test suite
├── Dockerfile              # Docker image definition
├── docker-compose.yml      # Optional Docker Compose configuration
└── README.md               # Project documentation
```

**Note:** This structure assumes your repository contains the files listed above.

## Getting Started

### 1. Clone or Download the Repository

Clone the repository and navigate to the project directory:

```bash
git clone <your-repository-url>
cd <your-repository-directory>
```

Replace the placeholders with your actual repository URL and directory name.

Alternatively, download the project files and navigate to the extracted directory.

### 2. Make the Scripts Executable

Run the following command from the project root:

```bash
chmod +x app/diagnostic.sh test.sh
```

## Usage

### 1. Run Locally

The diagnostic utility supports the following commands.

#### Display Help

```bash
./app/diagnostic.sh help
```

Displays available commands and usage instructions.

#### View System Information

```bash
./app/diagnostic.sh system
```

Displays system information, including uptime, kernel version, operating system distribution, and memory usage.

#### View Disk Usage

```bash
./app/diagnostic.sh disk
```

Displays current disk space utilization.

#### Check Network Connectivity

```bash
./app/diagnostic.sh network 8.8.8.8
```

Replace `8.8.8.8` with the hostname or IP address you want to test.

**Note:** A failed ping does not necessarily mean the destination is unreachable. Some hosts and networks block ICMP traffic.

### 2. Build the Docker Image

From the project root, build the Docker image:

```bash
docker build -t diagnostic-tool .
```

This creates a local image named `diagnostic-tool`, provided the Dockerfile builds successfully.

### 3. Run Commands with Docker

Docker allows you to execute diagnostic commands inside the container without installing the application directly into your host environment.

#### Run System Diagnostics

```bash
docker run --rm diagnostic-tool system
```

#### Check Disk Usage

```bash
docker run --rm diagnostic-tool disk
```

#### Test Network Connectivity

```bash
docker run --rm diagnostic-tool network 1.1.1.1
```

#### Display Help

```bash
docker run --rm diagnostic-tool help
```

The `--rm` option automatically removes the container after the command finishes. The Docker image remains available for subsequent runs.

**Important:** Network connectivity and disk usage are evaluated from the container's execution environment. Container networking and filesystem visibility may differ from the host system.

### 4. Run Commands with Docker Compose

If your repository contains a correctly configured `docker-compose.yml` file, you can use Docker Compose to run the application.

#### Run System Diagnostics

```bash
docker compose run --rm diagnostic system
```

#### Check Disk Usage

```bash
docker compose run --rm diagnostic disk
```

#### Check Network Connectivity

```bash
docker compose run --rm diagnostic network 1.1.1.1
```

#### Display Help

```bash
docker compose run --rm diagnostic help
```

In these examples, `diagnostic` is the Compose service name. Replace it if your configuration defines a different service name.

The `run` command creates a one-off container for the specified service, while `--rm` removes that container when it exits.

## Exit Codes

The application uses exit codes to communicate the outcome of each command.

| Exit Code | Description |
|---|---|
| `0` | Command executed successfully. |
| `1` | Operational or runtime failure, such as an unsuccessful network check. |
| `2` | Invalid command or missing required argument. |

These exit codes make the utility suitable for shell automation, automated tests, and CI/CD pipelines.

For example, you can inspect the exit status of a command with:

```bash
./app/diagnostic.sh disk
echo $?
```

The `echo $?` command displays the exit code of the most recently executed command.

## Testing

The project includes a test script for verifying application behavior and exit codes.

### 1. Make the Test Script Executable

```bash
chmod +x test.sh
```

### 2. Run the Test Suite

```bash
./test.sh
```

Review the test output to identify failed checks or unexpected behavior.

Run the tests after making changes to ensure that the application's commands and error handling continue to behave as expected.

## Technologies Used

- **Bash:** Implements command-line operations and diagnostic logic.
- **Linux:** Provides the operating system environment and diagnostic utilities.
- **Docker:** Packages the application into a container image.
- **Docker Compose:** Simplifies container execution through a service configuration.
- **Shell Testing:** Validates command behavior and exit codes.

## Use Cases

- Quick Linux system diagnostics
- Basic network connectivity troubleshooting
- Disk space monitoring
- Learning Bash scripting and CLI design
- Practicing Docker image creation and container execution
- Understanding exit-code handling and automated testing
- Building foundational DevOps skills

## License

No license has been specified. Add a `LICENSE` file if you intend to distribute or share this project publicly.

---

**Assignment:** TS Academy – Assignment 2  
**Project:** Diagnostic CLI Tool  
**Purpose:** Build practical Linux and DevOps skills through Bash-based diagnostics, Docker containerization, and automated testing.
