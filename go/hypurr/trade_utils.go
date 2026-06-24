package hypurr

func (t TimeInForce) ToHyperliquidString() string {
	switch t {
	case TimeInForce_GTC:
		return "Gtc"
	case TimeInForce_ALO:
		return "Alo"
	case TimeInForce_IOC:
		return "Ioc"
	}
	return ""
}
