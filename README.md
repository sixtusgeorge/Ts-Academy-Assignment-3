# Assignment 3: CI/CD Pipeline with Bash, Docker, and GitHub Actions

A professional DevOps CLI automation tool featuring local linting, robust unit testing, containerization, and a multi-stage 3-tier GitHub Actions CI/CD pipeline.

## Project Structure
```text
assignment-3/
├── README.md
├── Dockerfile
├── compose.yaml
├── .dockerignore
├── grade.sh
├── app/
│   └── app.sh
├── scripts/
│   ├── lint.sh
│   └── build.sh
├── tests/
│   └── test.sh
└── .github/
    └── workflows/
        └── ci.yml
```

## Installation & Setup
Clone the repository and run:
```bash
git clone <your-assignment-3-repo-url>
cd assignment-3
chmod +x grade.sh app/*.sh scripts/*.sh tests/*.sh
```

## Local Execution & Testing
* **Run Full Grader:**
  ```bash
  ./grade.sh
  ```
* **Run Unit Tests (8+ Test Suite):**
  ```bash
  ./tests/test.sh
  ```

## CI/CD Pipeline Architecture
The GitHub Actions workflow enforces strict 3-tier sequential dependencies (`needs:`):
1. **`validate` (Lint Check)**
2. **`test` (Unit Tests - 8 cases)**
3. **`docker` (Build & Smoke Test)**

## Assumptions & Security
* **Environment:** Linux / Ubuntu 24.04 / WSL2 with Bash 5+ and Docker.
* **Security:** Zero hardcoded credentials or secrets.
