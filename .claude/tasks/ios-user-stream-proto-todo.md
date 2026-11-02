# iOS User Stream Proto Plan

Specification: [[ios-user-stream-proto-spec]]

Status: Awaiting approval

## Approval

- [x] Confirm that this task includes the proto contract.
- [ ] Approve `WalletReference` with the two fields in the issue example.
- [ ] Approve this plan with the backend plan.

## Pseudocode Gate

- [ ] Include the proto layout in the cross-repository pseudocode.
- [ ] Show the estimated line count.
- [ ] Stop and wait for sign-off before the proto edit.

## Implementation

- [ ] Add `UserStream` to `IosService` in `hypurr/ios.proto`.
- [ ] Add `WalletReference` and the issue messages to `hypurr/ios.proto`.
- [ ] Stop and wait for proto review.
- [ ] Generate only the Go iOS files. Stop and wait for review.
- [ ] Generate only the TypeScript iOS files. Stop and wait for review.
- [ ] Generate only the Python iOS files. Stop and wait for review.

## Verification

- [ ] Run the targeted proto generators.
- [ ] Run `go test ./...`.
- [ ] Run `go build ./...`.
- [ ] Run `go vet ./...`.
- [ ] Import the generated Python modules.
- [ ] Run the available TypeScript type check.
- [ ] Run `git diff --check`.
- [ ] Quote the relevant command output before reporting completion.
