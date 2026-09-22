# Keep input order stable across filesystems and operating systems.
PROTO_FILES := $(sort $(shell find hypurr -type f -name '*.proto'))

# protoc and its bundled standard includes are pinned by package.json.
PROTOC := ./node_modules/.bin/protoc
GO_PLUGIN := $(CURDIR)/.tools/protoc-gen-go-v1.34.2/protoc-gen-go
GO_GRPC_PLUGIN := $(CURDIR)/.tools/protoc-gen-go-grpc-v1.4.0/protoc-gen-go-grpc
PY := .venv/bin/python

GO_OUT ?= go
TS_OUT ?= ts
PY_OUT ?= python

.PHONY: all build clean protoclean golang javascript python js-deps py-deps

all: build
build: golang javascript python

# Always regenerate all inputs, including dependants of imported protos.
# File timestamps are not reliable after a checkout or merge.
golang: js-deps $(GO_PLUGIN) $(GO_GRPC_PLUGIN)
	@mkdir -p $(GO_OUT)
	$(PROTOC) --proto_path=. \
		--plugin=protoc-gen-go=$(GO_PLUGIN) \
		--plugin=protoc-gen-go-grpc=$(GO_GRPC_PLUGIN) \
		--go_out=$(GO_OUT) --go-grpc_out=$(GO_OUT) \
		--go_opt=paths=source_relative --go-grpc_opt=paths=source_relative \
		$(PROTO_FILES)

javascript: js-deps
	@mkdir -p $(TS_OUT)
	$(PROTOC) --proto_path=. \
		--plugin=protoc-gen-ts=./node_modules/.bin/protoc-gen-ts \
		--ts_opt=long_type_number --ts_out=$(TS_OUT) $(PROTO_FILES)

python: py-deps
	@mkdir -p $(PY_OUT)
	$(PY) -m grpc_tools.protoc --proto_path=. \
		--python_out=$(PY_OUT) --grpc_python_out=$(PY_OUT) $(PROTO_FILES)

# Use the npm lockfile for the compiler wrapper and TypeScript plugin tree.
# Download protoc once before parallel language targets can invoke it.
js-deps: node_modules/.proto-deps
node_modules/.proto-deps: package.json package-lock.json
	npm ci --no-audit --no-fund
	$(PROTOC) --version
	@touch $@

# Install versioned Go plugins locally, never selecting binaries from PATH.
$(GO_PLUGIN):
	GOBIN=$(dir $(GO_PLUGIN)) go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.34.2

$(GO_GRPC_PLUGIN):
	GOBIN=$(dir $(GO_GRPC_PLUGIN)) go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.4.0

# Refresh existing virtualenvs when the pinned toolchain changes.
py-deps: .venv/.proto-deps
.venv/.proto-deps: requirements-proto.txt $(PY)
	$(PY) -m pip install --quiet -r requirements-proto.txt
	@touch $@

$(PY):
	python3 -m venv .venv

clean: protoclean
protoclean:
	rm -rf go/ ts/ python/
