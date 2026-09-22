# hypurr-grpc

Regenerate the Go, TypeScript and Python bindings with:

```sh
make build
```

Requires Go (see `go.mod`), Node.js/npm, and Python 3.10+ with `venv`.
The first run downloads the pinned generators; subsequent runs reuse them.
Use `make golang`, `make javascript`, or `make python` for one language.

Generation uses repository-local tools, independent of globally installed
`protoc` or Go plugins:

| Tool | Pinned version | Configuration |
| --- | --- | --- |
| protoc for Go/TypeScript, including standard proto definitions | 33.4 | `package.json` (`config.protocVersion`) |
| protoc-gen-go | 1.34.2 | `Makefile` |
| protoc-gen-go-grpc | 1.4.0 | `Makefile` |
| TypeScript plugin and protoc downloader | 2.11.1 | `package.json`, `package-lock.json` |
| Python compiler and gRPC generator | grpcio-tools 1.81.0 | `requirements-proto.txt` |

The Python generator bundles its own compiler. Both toolchains are pinned;
they do not need to share a compiler version. `make` uses `npm ci` to install
the locked JavaScript dependency tree. Do not invoke a system `protoc` to
regenerate checked-in files.

All protos are processed in sorted order on every run, so imported schema
changes and missing generated files are picked up regardless of timestamps.
Running `make build` twice with unchanged schemas should produce identical files.
When upgrading a generator, update its pin and lockfile, regenerate all bindings,
and review the resulting one-time changes together.
