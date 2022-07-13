Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3325736D3
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 15:06:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81A4F1715;
	Wed, 13 Jul 2022 15:05:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81A4F1715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657717566;
	bh=hnDGW4frvc9Zg0Vb3q9Wd/H0QNUzOfLQDDJ1gr3mvNc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ox9Evi6I3Tc6kJNEWKv9nrc6tfPFMA/RWKkEY03zt77IlBr1kl+gkKc8d6+GBfMcV
	 N/JHkkpSAMzVQBjyf0QsV3Tt9+TKUeb0OV7j39QKFWQs0FgrZ+MVMR/VfQ+hpc9b9E
	 f/Rm7J2rzriJWf1Bxi5mTXs+jxZcE3DosPfan73E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA14BF80254;
	Wed, 13 Jul 2022 15:05:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C1BEF80249; Wed, 13 Jul 2022 15:05:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F4DEF800AA
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 15:05:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F4DEF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aH8fm6PZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1427DB81F00;
 Wed, 13 Jul 2022 13:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B27CC34114;
 Wed, 13 Jul 2022 13:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657717498;
 bh=hnDGW4frvc9Zg0Vb3q9Wd/H0QNUzOfLQDDJ1gr3mvNc=;
 h=From:To:Cc:Subject:Date:From;
 b=aH8fm6PZEI40vPnLkQia7pKkAtLVZLf8hCMEs8ITe7cv+/J3qUp4YvMx1jiivUMfx
 NnYX6vkGpsfl5U9MoP+xy4QcOUPu5jRprNY4/i2fL6uenbOj1Re8RA44xaPy904rgD
 a6cfuZd+/3DmupoMIZWXWXEGMKvZsVje9qEq7qQQIcCpCEx3OUFG8JnTtQLyH7PGXV
 OPmtotJ9c9USAGUOCH+AawsuFVL4jrQiQWGhJlbuslmhvR/HzrI9wQjEKYf1dnDTkH
 VkMa8qWTf2CK5rR2oipiKF6YPCvm4PA2BMPF2B6oSSEVwV9PKTNH96m05JFDe0WXiB
 mozca7SUbVCKA==
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rockchip-i2s: Undo BCLK pinctrl changes
Date: Wed, 13 Jul 2022 14:04:51 +0100
Message-Id: <20220713130451.31481-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8485; h=from:subject;
 bh=hnDGW4frvc9Zg0Vb3q9Wd/H0QNUzOfLQDDJ1gr3mvNc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBizsK6UDEoRaAZQ89mYlPLCH9UEqOspXXWL7XYWDD3
 SDWDOs+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYs7CugAKCRAk1otyXVSH0O3zB/
 9BzzTO/Ns++HNsBUuZ+FcTGp2FXXYHy+hwI2tZ0LWk3tR4VN0G5EHrGx5x4UTdT76kfh1Zt9bjGmdV
 Nql3kZnpem2e5S9z2FYfZWRh6/Bbh6BZ4shn6Cmk2sKm7tZHmq456FO7mMs7bFQCIVmDQ2hnZY2LsU
 UrVBjvpjUb+cyPj+tSNR8QDuF5ZW1UnCkcHvD80Q8qGNMwlTAJ1tY6Tt/vEUiHmvQeYv3oVJMDC2Qi
 pPU3uncOdGC981nQWH2WWBXdR0jfz963vwVJ6fe9tUm7jsdCBTA6beY/UkJT7wPBm/nU8hOfHn8KXM
 x0aIh9LkYygBYrN9NFOeXlASi0oYsb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

The version of the BCLK pinctrl management changes that made it into
v5.19 has caused problems on some systems due to overly strict DT
requirements but attempts to fix it have caused further breakage on
other platforms.  Just drop the changes for this release, we already
have a better version queued for -next.

Fixes: 26b9f2fa7b1c ("ASoC: rockchip: i2s: Fix NULL pointer dereference when pinctrl is not found")
Fixes: a5450aba737d ("ASoC: rockchip: i2s: switch BCLK to GPIO")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/rockchip/rockchip_i2s.c | 163 ++++++------------------------
 1 file changed, 31 insertions(+), 132 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index c9fedf6eb2e6..4ce5d2579387 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -13,7 +13,6 @@
 #include <linux/of_gpio.h>
 #include <linux/of_device.h>
 #include <linux/clk.h>
-#include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/spinlock.h>
@@ -55,40 +54,8 @@ struct rk_i2s_dev {
 	const struct rk_i2s_pins *pins;
 	unsigned int bclk_ratio;
 	spinlock_t lock; /* tx/rx lock */
-	struct pinctrl *pinctrl;
-	struct pinctrl_state *bclk_on;
-	struct pinctrl_state *bclk_off;
 };
 
-static int i2s_pinctrl_select_bclk_on(struct rk_i2s_dev *i2s)
-{
-	int ret = 0;
-
-	if (!IS_ERR(i2s->pinctrl) && !IS_ERR_OR_NULL(i2s->bclk_on))
-		ret = pinctrl_select_state(i2s->pinctrl,
-				     i2s->bclk_on);
-
-	if (ret)
-		dev_err(i2s->dev, "bclk enable failed %d\n", ret);
-
-	return ret;
-}
-
-static int i2s_pinctrl_select_bclk_off(struct rk_i2s_dev *i2s)
-{
-
-	int ret = 0;
-
-	if (!IS_ERR(i2s->pinctrl) && !IS_ERR_OR_NULL(i2s->bclk_off))
-		ret = pinctrl_select_state(i2s->pinctrl,
-				     i2s->bclk_off);
-
-	if (ret)
-		dev_err(i2s->dev, "bclk disable failed %d\n", ret);
-
-	return ret;
-}
-
 static int i2s_runtime_suspend(struct device *dev)
 {
 	struct rk_i2s_dev *i2s = dev_get_drvdata(dev);
@@ -125,49 +92,38 @@ static inline struct rk_i2s_dev *to_info(struct snd_soc_dai *dai)
 	return snd_soc_dai_get_drvdata(dai);
 }
 
-static int rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
+static void rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
 {
 	unsigned int val = 0;
 	int retry = 10;
-	int ret = 0;
 
 	spin_lock(&i2s->lock);
 	if (on) {
-		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
-				I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_ENABLE);
-		if (ret < 0)
-			goto end;
+		regmap_update_bits(i2s->regmap, I2S_DMACR,
+				   I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_ENABLE);
 
-		ret = regmap_update_bits(i2s->regmap, I2S_XFER,
-				I2S_XFER_TXS_START | I2S_XFER_RXS_START,
-				I2S_XFER_TXS_START | I2S_XFER_RXS_START);
-		if (ret < 0)
-			goto end;
+		regmap_update_bits(i2s->regmap, I2S_XFER,
+				   I2S_XFER_TXS_START | I2S_XFER_RXS_START,
+				   I2S_XFER_TXS_START | I2S_XFER_RXS_START);
 
 		i2s->tx_start = true;
 	} else {
 		i2s->tx_start = false;
 
-		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
-				I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_DISABLE);
-		if (ret < 0)
-			goto end;
+		regmap_update_bits(i2s->regmap, I2S_DMACR,
+				   I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_DISABLE);
 
 		if (!i2s->rx_start) {
-			ret = regmap_update_bits(i2s->regmap, I2S_XFER,
-					I2S_XFER_TXS_START |
-					I2S_XFER_RXS_START,
-					I2S_XFER_TXS_STOP |
-					I2S_XFER_RXS_STOP);
-			if (ret < 0)
-				goto end;
+			regmap_update_bits(i2s->regmap, I2S_XFER,
+					   I2S_XFER_TXS_START |
+					   I2S_XFER_RXS_START,
+					   I2S_XFER_TXS_STOP |
+					   I2S_XFER_RXS_STOP);
 
 			udelay(150);
-			ret = regmap_update_bits(i2s->regmap, I2S_CLR,
-					I2S_CLR_TXC | I2S_CLR_RXC,
-					I2S_CLR_TXC | I2S_CLR_RXC);
-			if (ret < 0)
-				goto end;
+			regmap_update_bits(i2s->regmap, I2S_CLR,
+					   I2S_CLR_TXC | I2S_CLR_RXC,
+					   I2S_CLR_TXC | I2S_CLR_RXC);
 
 			regmap_read(i2s->regmap, I2S_CLR, &val);
 
@@ -182,57 +138,44 @@ static int rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
 			}
 		}
 	}
-end:
 	spin_unlock(&i2s->lock);
-	if (ret < 0)
-		dev_err(i2s->dev, "lrclk update failed\n");
-
-	return ret;
 }
 
-static int rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
+static void rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
 {
 	unsigned int val = 0;
 	int retry = 10;
-	int ret = 0;
 
 	spin_lock(&i2s->lock);
 	if (on) {
-		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
+		regmap_update_bits(i2s->regmap, I2S_DMACR,
 				   I2S_DMACR_RDE_ENABLE, I2S_DMACR_RDE_ENABLE);
-		if (ret < 0)
-			goto end;
 
-		ret = regmap_update_bits(i2s->regmap, I2S_XFER,
+		regmap_update_bits(i2s->regmap, I2S_XFER,
 				   I2S_XFER_TXS_START | I2S_XFER_RXS_START,
 				   I2S_XFER_TXS_START | I2S_XFER_RXS_START);
-		if (ret < 0)
-			goto end;
 
 		i2s->rx_start = true;
 	} else {
 		i2s->rx_start = false;
 
-		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
+		regmap_update_bits(i2s->regmap, I2S_DMACR,
 				   I2S_DMACR_RDE_ENABLE, I2S_DMACR_RDE_DISABLE);
-		if (ret < 0)
-			goto end;
 
 		if (!i2s->tx_start) {
-			ret = regmap_update_bits(i2s->regmap, I2S_XFER,
+			regmap_update_bits(i2s->regmap, I2S_XFER,
 					   I2S_XFER_TXS_START |
 					   I2S_XFER_RXS_START,
 					   I2S_XFER_TXS_STOP |
 					   I2S_XFER_RXS_STOP);
-			if (ret < 0)
-				goto end;
+
 			udelay(150);
-			ret = regmap_update_bits(i2s->regmap, I2S_CLR,
+			regmap_update_bits(i2s->regmap, I2S_CLR,
 					   I2S_CLR_TXC | I2S_CLR_RXC,
 					   I2S_CLR_TXC | I2S_CLR_RXC);
-			if (ret < 0)
-				goto end;
+
 			regmap_read(i2s->regmap, I2S_CLR, &val);
+
 			/* Should wait for clear operation to finish */
 			while (val) {
 				regmap_read(i2s->regmap, I2S_CLR, &val);
@@ -244,12 +187,7 @@ static int rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
 			}
 		}
 	}
-end:
 	spin_unlock(&i2s->lock);
-	if (ret < 0)
-		dev_err(i2s->dev, "lrclk update failed\n");
-
-	return ret;
 }
 
 static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
@@ -487,26 +425,17 @@ static int rockchip_i2s_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
-			ret = rockchip_snd_rxctrl(i2s, 1);
+			rockchip_snd_rxctrl(i2s, 1);
 		else
-			ret = rockchip_snd_txctrl(i2s, 1);
-		/* Do not turn on bclk if lrclk open fails. */
-		if (ret < 0)
-			return ret;
-		i2s_pinctrl_select_bclk_on(i2s);
+			rockchip_snd_txctrl(i2s, 1);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
-			if (!i2s->tx_start)
-				i2s_pinctrl_select_bclk_off(i2s);
-			ret = rockchip_snd_rxctrl(i2s, 0);
-		} else {
-			if (!i2s->rx_start)
-				i2s_pinctrl_select_bclk_off(i2s);
-			ret = rockchip_snd_txctrl(i2s, 0);
-		}
+		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+			rockchip_snd_rxctrl(i2s, 0);
+		else
+			rockchip_snd_txctrl(i2s, 0);
 		break;
 	default:
 		ret = -EINVAL;
@@ -807,36 +736,6 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 	}
 
 	i2s->bclk_ratio = 64;
-	i2s->pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (IS_ERR(i2s->pinctrl)) {
-		dev_err(&pdev->dev, "failed to find i2s pinctrl\n");
-		ret = PTR_ERR(i2s->pinctrl);
-		goto err_clk;
-	}
-
-	i2s->bclk_on = pinctrl_lookup_state(i2s->pinctrl,
-				   "bclk_on");
-	if (IS_ERR_OR_NULL(i2s->bclk_on))
-		dev_err(&pdev->dev, "failed to find i2s default state\n");
-	else
-		dev_dbg(&pdev->dev, "find i2s bclk state\n");
-
-	i2s->bclk_off = pinctrl_lookup_state(i2s->pinctrl,
-				  "bclk_off");
-	if (IS_ERR_OR_NULL(i2s->bclk_off))
-		dev_err(&pdev->dev, "failed to find i2s gpio state\n");
-	else
-		dev_dbg(&pdev->dev, "find i2s bclk_off state\n");
-
-	i2s_pinctrl_select_bclk_off(i2s);
-
-	i2s->playback_dma_data.addr = res->start + I2S_TXDR;
-	i2s->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	i2s->playback_dma_data.maxburst = 4;
-
-	i2s->capture_dma_data.addr = res->start + I2S_RXDR;
-	i2s->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	i2s->capture_dma_data.maxburst = 4;
 
 	dev_set_drvdata(&pdev->dev, i2s);
 
-- 
2.30.2

