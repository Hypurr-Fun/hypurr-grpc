# Protobuf definitions
PROTO_FILES := $(shell find hypurr -type f -name '*.proto')
# Protobuf Go files
PROTO_GEN_GO_FILES = $(patsubst %.proto, go/%.pb.go, $(PROTO_FILES))
PROTO_GEN_GO_GRPC_FILES = $(patsubst %.proto, go/%_grpc.pb.go, $(PROTO_FILES))
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
PROTO_PY_MAKER := python3 -m grpc_tools.protoc --proto_path=.

GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean

.PHONY: all build clean golang javascript python

# Default target
all: build

# Build everything
build: golang javascript python

# Compile Protobuf for Go
golang: $(PROTO_GEN_GO_FILES)

# Compile Protobuf for TypeScript
javascript: $(PROTO_GEN_TS_FILES)

# Compile Protobuf for Python
python: $(PROTO_GEN_PY_FILES)

# Generate Go protobuf files
go/%.pb.go go/%_grpc.pb.go: %.proto
	@mkdir -p $(dir $@)
	$(PROTO_GO_MAKER) \
		--go_out=go --go-grpc_out=go \
		--go_opt=paths=source_relative --go-grpc_opt=paths=source_relative \
		$<

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
