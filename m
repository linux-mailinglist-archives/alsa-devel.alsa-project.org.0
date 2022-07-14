Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8F15742E2
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:27:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CCD0181C;
	Thu, 14 Jul 2022 06:26:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CCD0181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657772864;
	bh=eSz5cAic2YhTWxKYXA054F8AqKddUkNlYy8xxeu0kIU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n+juibfWTbgx6Vr6M5LISdfJBNyRwFvvv7Gcg9/WUB4O4L7MekSXEVUQ9QZWmv9RX
	 0gIuvDfUNCDh600VKtJ0Y2Rp3//eT1C1yhzVM7gSnYtyElDNkQ0p5ENMVaHxm08bs2
	 S7VZn5f5C7KWvjBr4LOZ1KJoUjSIkK7z4u/3UkSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3234AF805D8;
	Thu, 14 Jul 2022 06:23:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59D00F805D7; Thu, 14 Jul 2022 06:23:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A87B0F805C1
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A87B0F805C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uHMPpszY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 646E661E9A;
 Thu, 14 Jul 2022 04:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB63C385A5;
 Thu, 14 Jul 2022 04:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772585;
 bh=eSz5cAic2YhTWxKYXA054F8AqKddUkNlYy8xxeu0kIU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uHMPpszY0/LkvVHOI2rAZAp9SqJGXexuaFD7/wcoQAZUuRmVIw74hla54krjiTqmN
 SLGO1pGkOaKwpn+gb6Pe+/XNcaKdNfCctlx0rJFFRvyQQOuzkSlg7vPRtmO/jEnl+N
 zghFv8z6Zmgb+RZXimrCcFHeWc3oIH6gxziIDHCbOG64L3/yYbNxDXE7AxqSCDI6UI
 oVYWy7yUE+gLbwflHwkcxQzMnvKzVHdGrHbPo6via0NHgH6W3t1YHVObmrbYQSOlUU
 X1japoWN/43GeXRyyTpr7LFXrERT/23PW4fQha1dAvDdlPo0Ygv9Asdlqk+PAbgx18
 P8DLoJD2GGuPQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 16/41] ASoC: rockchip: i2s: switch BCLK to GPIO
Date: Thu, 14 Jul 2022 00:21:56 -0400
Message-Id: <20220714042221.281187-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042221.281187-1-sashal@kernel.org>
References: <20220714042221.281187-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 heiko@sntech.de, tiwai@suse.com, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Judy Hsiao <judyhsiao@chromium.org>, linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Judy Hsiao <judyhsiao@chromium.org>

[ Upstream commit a5450aba737dae3ee1a64b282e609d8375d6700c ]

We discoverd that the state of BCLK on, LRCLK off and SD_MODE on
may cause the speaker melting issue. Removing LRCLK while BCLK
is present can cause unexpected output behavior including a large
DC output voltage as described in the Max98357a datasheet.

In order to:
  1. prevent BCLK from turning on by other component.
  2. keep BCLK and LRCLK being present at the same time

This patch switches BCLK to GPIO func before LRCLK output, and
configures BCLK func back during LRCLK is output.

Without this fix, BCLK is turned on 11 ms earlier than LRCK by the
da7219.
With this fix, BCLK is turned on only 0.4 ms earlier than LRCK by
the rockchip codec.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
Link: https://lore.kernel.org/r/20220615045643.3137287-1-judyhsiao@chromium.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/rockchip/rockchip_i2s.c | 160 ++++++++++++++++++++++++------
 1 file changed, 129 insertions(+), 31 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 4ce5d2579387..99a128a666fb 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -13,6 +13,7 @@
 #include <linux/of_gpio.h>
 #include <linux/of_device.h>
 #include <linux/clk.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/spinlock.h>
@@ -54,8 +55,40 @@ struct rk_i2s_dev {
 	const struct rk_i2s_pins *pins;
 	unsigned int bclk_ratio;
 	spinlock_t lock; /* tx/rx lock */
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *bclk_on;
+	struct pinctrl_state *bclk_off;
 };
 
+static int i2s_pinctrl_select_bclk_on(struct rk_i2s_dev *i2s)
+{
+	int ret = 0;
+
+	if (!IS_ERR(i2s->pinctrl) && !IS_ERR_OR_NULL(i2s->bclk_on))
+		ret = pinctrl_select_state(i2s->pinctrl,
+				     i2s->bclk_on);
+
+	if (ret)
+		dev_err(i2s->dev, "bclk enable failed %d\n", ret);
+
+	return ret;
+}
+
+static int i2s_pinctrl_select_bclk_off(struct rk_i2s_dev *i2s)
+{
+
+	int ret = 0;
+
+	if (!IS_ERR(i2s->pinctrl) && !IS_ERR_OR_NULL(i2s->bclk_off))
+		ret = pinctrl_select_state(i2s->pinctrl,
+				     i2s->bclk_off);
+
+	if (ret)
+		dev_err(i2s->dev, "bclk disable failed %d\n", ret);
+
+	return ret;
+}
+
 static int i2s_runtime_suspend(struct device *dev)
 {
 	struct rk_i2s_dev *i2s = dev_get_drvdata(dev);
@@ -92,38 +125,49 @@ static inline struct rk_i2s_dev *to_info(struct snd_soc_dai *dai)
 	return snd_soc_dai_get_drvdata(dai);
 }
 
-static void rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
+static int rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
 {
 	unsigned int val = 0;
 	int retry = 10;
+	int ret = 0;
 
 	spin_lock(&i2s->lock);
 	if (on) {
-		regmap_update_bits(i2s->regmap, I2S_DMACR,
-				   I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_ENABLE);
+		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
+				I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_ENABLE);
+		if (ret < 0)
+			goto end;
 
-		regmap_update_bits(i2s->regmap, I2S_XFER,
-				   I2S_XFER_TXS_START | I2S_XFER_RXS_START,
-				   I2S_XFER_TXS_START | I2S_XFER_RXS_START);
+		ret = regmap_update_bits(i2s->regmap, I2S_XFER,
+				I2S_XFER_TXS_START | I2S_XFER_RXS_START,
+				I2S_XFER_TXS_START | I2S_XFER_RXS_START);
+		if (ret < 0)
+			goto end;
 
 		i2s->tx_start = true;
 	} else {
 		i2s->tx_start = false;
 
-		regmap_update_bits(i2s->regmap, I2S_DMACR,
-				   I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_DISABLE);
+		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
+				I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_DISABLE);
+		if (ret < 0)
+			goto end;
 
 		if (!i2s->rx_start) {
-			regmap_update_bits(i2s->regmap, I2S_XFER,
-					   I2S_XFER_TXS_START |
-					   I2S_XFER_RXS_START,
-					   I2S_XFER_TXS_STOP |
-					   I2S_XFER_RXS_STOP);
+			ret = regmap_update_bits(i2s->regmap, I2S_XFER,
+					I2S_XFER_TXS_START |
+					I2S_XFER_RXS_START,
+					I2S_XFER_TXS_STOP |
+					I2S_XFER_RXS_STOP);
+			if (ret < 0)
+				goto end;
 
 			udelay(150);
-			regmap_update_bits(i2s->regmap, I2S_CLR,
-					   I2S_CLR_TXC | I2S_CLR_RXC,
-					   I2S_CLR_TXC | I2S_CLR_RXC);
+			ret = regmap_update_bits(i2s->regmap, I2S_CLR,
+					I2S_CLR_TXC | I2S_CLR_RXC,
+					I2S_CLR_TXC | I2S_CLR_RXC);
+			if (ret < 0)
+				goto end;
 
 			regmap_read(i2s->regmap, I2S_CLR, &val);
 
@@ -138,44 +182,57 @@ static void rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
 			}
 		}
 	}
+end:
 	spin_unlock(&i2s->lock);
+	if (ret < 0)
+		dev_err(i2s->dev, "lrclk update failed\n");
+
+	return ret;
 }
 
-static void rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
+static int rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
 {
 	unsigned int val = 0;
 	int retry = 10;
+	int ret = 0;
 
 	spin_lock(&i2s->lock);
 	if (on) {
-		regmap_update_bits(i2s->regmap, I2S_DMACR,
+		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
 				   I2S_DMACR_RDE_ENABLE, I2S_DMACR_RDE_ENABLE);
+		if (ret < 0)
+			goto end;
 
-		regmap_update_bits(i2s->regmap, I2S_XFER,
+		ret = regmap_update_bits(i2s->regmap, I2S_XFER,
 				   I2S_XFER_TXS_START | I2S_XFER_RXS_START,
 				   I2S_XFER_TXS_START | I2S_XFER_RXS_START);
+		if (ret < 0)
+			goto end;
 
 		i2s->rx_start = true;
 	} else {
 		i2s->rx_start = false;
 
-		regmap_update_bits(i2s->regmap, I2S_DMACR,
+		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
 				   I2S_DMACR_RDE_ENABLE, I2S_DMACR_RDE_DISABLE);
+		if (ret < 0)
+			goto end;
 
 		if (!i2s->tx_start) {
-			regmap_update_bits(i2s->regmap, I2S_XFER,
+			ret = regmap_update_bits(i2s->regmap, I2S_XFER,
 					   I2S_XFER_TXS_START |
 					   I2S_XFER_RXS_START,
 					   I2S_XFER_TXS_STOP |
 					   I2S_XFER_RXS_STOP);
-
+			if (ret < 0)
+				goto end;
 			udelay(150);
-			regmap_update_bits(i2s->regmap, I2S_CLR,
+			ret = regmap_update_bits(i2s->regmap, I2S_CLR,
 					   I2S_CLR_TXC | I2S_CLR_RXC,
 					   I2S_CLR_TXC | I2S_CLR_RXC);
-
+			if (ret < 0)
+				goto end;
 			regmap_read(i2s->regmap, I2S_CLR, &val);
-
 			/* Should wait for clear operation to finish */
 			while (val) {
 				regmap_read(i2s->regmap, I2S_CLR, &val);
@@ -187,7 +244,12 @@ static void rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
 			}
 		}
 	}
+end:
 	spin_unlock(&i2s->lock);
+	if (ret < 0)
+		dev_err(i2s->dev, "lrclk update failed\n");
+
+	return ret;
 }
 
 static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
@@ -425,17 +487,26 @@ static int rockchip_i2s_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
-			rockchip_snd_rxctrl(i2s, 1);
+			ret = rockchip_snd_rxctrl(i2s, 1);
 		else
-			rockchip_snd_txctrl(i2s, 1);
+			ret = rockchip_snd_txctrl(i2s, 1);
+		/* Do not turn on bclk if lrclk open fails. */
+		if (ret < 0)
+			return ret;
+		i2s_pinctrl_select_bclk_on(i2s);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
-			rockchip_snd_rxctrl(i2s, 0);
-		else
-			rockchip_snd_txctrl(i2s, 0);
+		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+			if (!i2s->tx_start)
+				i2s_pinctrl_select_bclk_off(i2s);
+			ret = rockchip_snd_rxctrl(i2s, 0);
+		} else {
+			if (!i2s->rx_start)
+				i2s_pinctrl_select_bclk_off(i2s);
+			ret = rockchip_snd_txctrl(i2s, 0);
+		}
 		break;
 	default:
 		ret = -EINVAL;
@@ -736,6 +807,33 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 	}
 
 	i2s->bclk_ratio = 64;
+	i2s->pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (IS_ERR(i2s->pinctrl))
+		dev_err(&pdev->dev, "failed to find i2s pinctrl\n");
+
+	i2s->bclk_on = pinctrl_lookup_state(i2s->pinctrl,
+				   "bclk_on");
+	if (IS_ERR_OR_NULL(i2s->bclk_on))
+		dev_err(&pdev->dev, "failed to find i2s default state\n");
+	else
+		dev_dbg(&pdev->dev, "find i2s bclk state\n");
+
+	i2s->bclk_off = pinctrl_lookup_state(i2s->pinctrl,
+				  "bclk_off");
+	if (IS_ERR_OR_NULL(i2s->bclk_off))
+		dev_err(&pdev->dev, "failed to find i2s gpio state\n");
+	else
+		dev_dbg(&pdev->dev, "find i2s bclk_off state\n");
+
+	i2s_pinctrl_select_bclk_off(i2s);
+
+	i2s->playback_dma_data.addr = res->start + I2S_TXDR;
+	i2s->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	i2s->playback_dma_data.maxburst = 4;
+
+	i2s->capture_dma_data.addr = res->start + I2S_RXDR;
+	i2s->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	i2s->capture_dma_data.maxburst = 4;
 
 	dev_set_drvdata(&pdev->dev, i2s);
 
-- 
2.35.1

