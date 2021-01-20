function dp(x, scale) {
	if (scale < 120)
		return x
	return (x * scale) / 160
}
