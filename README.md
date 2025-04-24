# 🚀 Python Using UV + Flask + Docker

Welcome to the **Python Using UV** learning project! This simple yet powerful setup is aimed at exploring [**UV**](https://docs.astral.sh/uv/), the blazing-fast Python package manager, and running a basic Flask app using Docker and `docker-compose`.
Video refrence : https://www.youtube.com/watch?v=6pttmsBSi8M
---

## 📚 About the Project

This project demonstrates how to:
- Replace `pip`, `virtualenv`, and `requirements.txt` with **UV**.
- Use **UV** to manage packages and environments.
- Run a simple Flask app via `uv run`.
- Containerize the project with Docker and manage it via `docker-compose`.

---

## 🛠️ Project Structure

```bash
.
├── app.py                 # Flask Application
├── uv.lock                # Locked dependencies file
├── pyproject.toml         # Project metadata and dependencies
├── Dockerfile             # Docker setup for Flask + UV
├── docker-compose.yml     # Compose file to run the app
└── README.md              # You're here!
```

---

## ⚡ UV Commands Used

```bash
uv init .                         # Initialize the project
uv add flask                  # Install Flask via UV
uv run app.py                     # Run the app
uv uninstall <package>           # Uninstall a package
uv sync                           # Install from pyproject.toml & uv.lock
```

---

## 🐳 Running with Docker

### 1. Build the image:
```bash
docker compose build
```

### 2. Start the container:
```bash
docker compose up
```

### 3. Access the Flask App:
Open your browser at [http://localhost:5000](http://localhost:5000)

---

## 📌 Why UV?

- 🔥 Ultra-fast dependency management
- 🧼 Clean and modern replacement for `pip`, `venv`, and `requirements.txt`
- 📦 Lockfile-based installations for reproducibility

---

## 🔍 References

- [UV Official Docs](https://docs.astral.sh/uv/)
- [Flask Documentation](https://flask.palletsprojects.com/)
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

---

## ❤️ Author

Crafted with love for learning and productivity.

---
