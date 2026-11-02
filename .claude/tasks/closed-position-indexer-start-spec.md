> [!note]
> Superseded by the timestamp-precision implementation in hypurr-bot. The request fields and indexer lookup were removed.

# Start indexer pages after a PG close

Add optional wallet-address and position-ID fields to ClosedPositionsRequest.
The pair identifies a full close in one of the requested wallets.
Reject incomplete pairs, an unselected wallet, a missing close, or a pair combined with page_token.
The indexer resolves the exact trade timestamp and reuses its existing pagination query.

The bot always tries PG first. On fallback without an indexer token, send the last PG close as the starting point.
With an indexer token, send that token unchanged. Each bot page makes at most one indexer request.
Use the existing protobuf request type in the controller to avoid extra positional arguments.

Pass: spot and perp starting points, timestamp ties, invalid inputs, and continuation tokens pass tests.
Verify bot pagination through both sources with exactly one RPC per indexer page.
Regenerate all language bindings. Test consumers against the local protocol checkout.

Exclude grouping, data migrations, production operations, and unrelated build repairs.
Publish the protocol and update both dependencies before deployment. Deploy the indexer before the bot.
