# knor-docker

Dockerized build and runner for the [Knor](https://github.com/trolando/knor) solver, supporting multiple solver modes for the PGAME competition.

This repository includes Knor as a Git submodule, and provides a clean Docker interface for compiling and executing the solver in three configurations.

## 🔧 Solver Modes

| Mode | Flag    | Description            |
|------|---------|------------------------|
| `1`  | `--tlq` | TLQ solver mode        |
| `2`  | `--tl`  | TL solver mode         |
| `3`  | `--npp` | NPP solver mode        |

---

## 🚀 Getting Started

### 1. Clone with Submodules

```bash
git clone --recurse-submodules https://github.com/trolando/knor-docker.git
cd knor-docker
git submodule update --init --recursive
```

### 2. Build the Docker Image

```bash
docker build -t knor .
```

This compiles Knor using the included CMake-based build system.

### 3. Run Knor on a Local File

Mount your local directory (containing `.tlsf.ehoa` files, etc.):

```bash
docker run --rm -v "${PWD}:/work" knor 1 /work/example.tlsf.ehoa
```

This selects solver mode 1 (`--tlq`) and runs it on `example.tlsf.ehoa`.