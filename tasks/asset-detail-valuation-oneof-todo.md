# AssetDetail valuation oneof — todo

Goal: in `hypurr/ios.proto`, wrap the valuation figure of `AssetDetailPriceSummary`
and `AssetDetailLiveUpdate` in a oneof — spot sends `market_cap_cents`, perp sends
`open_interests_cents`.

## Plan
- [ ] `AssetDetailPriceSummary`: wrap existing `int64 market_cap_cents = 4` in
      `oneof valuation`, add `int64 open_interests_cents = 5`.
- [ ] `AssetDetailLiveUpdate`: wrap existing `int64 market_cap_cents = 3` in
      `oneof valuation`, add `int64 open_interests_cents = 4`.
- [ ] Verify with `protoc`/`buf` compile.

## Decisions
- Field numbers unchanged for `market_cap_cents` → wire-compatible for existing
  spot payloads (single field moved into a new oneof is safe in proto3).
- `open_interests_cents` spelling taken verbatim from request (conventional would
  be `open_interest_cents` — flagged, awaiting Greg's call).
- Comments on `AssetDetailLiveUpdate` header mention "market cap display"; will
  adjust that comment line to cover both cases.

## Out of scope
- Backend/mobile code consuming these messages (separate repos).
- Any other message touching market cap.
