# Protobuf definitions
PROTO_FILES := $(shell find hypurr -type f -name '*.proto')
# Protobuf TypeScript files
PROTO_GEN_TS_FILES = $(patsubst %.proto, ts/%_pb.js, $(PROTO_FILES))
# Protobuf Python files
PROTO_GEN_PY_FILES = $(patsubst %.proto, python/%_pb2.py, $(PROTO_FILES))
PROTO_GEN_PY_GRPC_FILES = $(patsubst %.proto, python/%_pb2_grpc.py, $(PROTO_FILES))

# Protobuf Go generator
PROTO_GO_MAKER := protoc --proto_path=. --proto_path=/usr/local/include

# Protobuf TypeScript generator
PROTO_TS_MAKER := npx protoc --plugin=protoc-gen-ts=./node_modules/.bin/protoc-gen-ts

# Protobuf Python generator
# Use a local venv: the system grpcio-tools may bundle a protoc too old to
# parse proto3 explicit `optional` fields. `make py-deps` provisions it.
PY := .venv/bin/python
PROTO_PY_MAKER := $(PY) -m grpc_tools.protoc --proto_path=.

GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean

.PHONY: all build clean golang javascript python py-deps

# Default target
all: build

# Build everything
build: golang javascript python

# Compile Protobuf for Go. Always regenerate: checked-in generated files can
# retain newer mtimes while containing stale output after a merge.
golang:
	@mkdir -p go
	$(PROTO_GO_MAKER) \
		--go_out=go --go-grpc_out=go \
		--go_opt=paths=source_relative --go-grpc_opt=paths=source_relative \
		$(PROTO_FILES)

# Compile Protobuf for TypeScript
javascript: $(PROTO_GEN_TS_FILES)

# Compile Protobuf for Python
python: py-deps $(PROTO_GEN_PY_FILES)

# Provision the Python toolchain (modern grpcio-tools) in a local venv
py-deps: $(PY)
$(PY):
	python3 -m venv .venv
	$(PY) -m pip install --quiet --upgrade pip 'grpcio-tools>=1.62'

# Generate TypeScript protobuf files
ts/%_pb.js: %.proto
	@mkdir -p $(dir $@)
	$(PROTO_TS_MAKER) \
		--proto_path=. \
		--ts_opt=long_type_number \
		--ts_out=ts \
		$<

# Generate Python protobuf files
python/%_pb2.py python/%_pb2_grpc.py: %.proto
	@mkdir -p $(dir $@)
	$(PROTO_PY_MAKER) \
		--python_out=python \
		--grpc_python_out=python \
		$<

# Cleanup generated files
clean: protoclean

protoclean:
	rm -rf go/ ts/ python/
