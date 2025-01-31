package hypurr

import (
	"strconv"
)

func (x *HyperliquidLaunchTradeRequest) TelegramID() int64 {
	userIdStr, ok := x.AuthData["id"]
	if !ok {
		return 0
	}
	userId, err := strconv.ParseInt(userIdStr, 10, 64)
	if err != nil {
		return 0
	}
	return userId
}

// Rate limit weights
func (x *HyperliquidDeployAuctionRequest) Weight() uint32 {
	return 1
}

func (x *HyperliquidTokensRequest) Weight() uint32 {
	return 1
}

func (x *HyperliquidTokenHoldersRequest) Weight() uint32 {
	return 5
}

func (x *HyperliquidTokenMessagesRequest) Weight() uint32 {
	return 2
}

func (x *HyperliquidSpotPairRequest) Weight() uint32 {
	return 1
}

func (x *HyperliquidSpotPairsRequest) Weight() uint32 {
	return 2
}

func (x *HyperliquidPerpPairsRequest) Weight() uint32 {
	return 2
}

func (x *HyperliquidWalletRequest) Weight() uint32 {
	return 2
}

func (x *HyperliquidWalletPerformanceRequest) Weight() uint32 {
	return 10
}

func (x *HyperliquidLaunchRequest) Weight() uint32 {
	return 1
}

func (x *HyperliquidLaunchesRequest) Weight() uint32 {
	return 2
}

func (x *HyperliquidLaunchStreamRequest) Weight() uint32 {
	return 2
}

func (x *HyperliquidLaunchFillsRequest) Weight() uint32 {
	return 2
}

func (x *LatestHyperliquidLaunchFillsRequest) Weight() uint32 {
	return 2
}

func (x *HyperliquidLaunchCandlesRequest) Weight() uint32 {
	return 2
}

func (x *HyperliquidLaunchMessagesRequest) Weight() uint32 {
	return 2
}

func (x *HyperliquidLaunchHoldersRequest) Weight() uint32 {
	return 5
}

func (x *HypurrFunCabalsRequest) Weight() uint32 {
	return 2
}
