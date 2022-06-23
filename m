Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9D35570F3
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 04:13:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08ED31B2F;
	Thu, 23 Jun 2022 04:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08ED31B2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655950419;
	bh=BvSGVcIVIwwOfGeg07tm8CQomzQrDrMViK6QwIMMI+4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uRGxrg52BBk8Suwlnk2346SvHlQIc43gvFT0vKdUol+OGNLjo8oTeOb/8mc/0Y1Tx
	 /qL1JcaI/Vn8lme2LxBrd8v9QwCf4d6CwFWGb1DjxHTPuFcZJTT+aYYpiKR58L9j8H
	 0dGggMg1bHtjAgbcMzQ1pMreQCdhUbVgSnCmmPII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDC1FF8052E;
	Thu, 23 Jun 2022 04:12:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A928BF800CB; Thu, 23 Jun 2022 04:12:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 263AEF800CB
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 04:12:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 263AEF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="kEgb9LUq"
Received: by mail-pl1-x635.google.com with SMTP id k14so5429685plh.4
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 19:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B49d4SIox+e+mb7jQzvkFTKZpAevCiiZS2mIDlEpl4k=;
 b=kEgb9LUqG+MZosF6hO/uW1v1tK8ivJcSTm0EWjSMAdk7qY3wyvK7sS4oHwSdxT2VQC
 yTVQhyPgZlwNGLuqtKrRq8c40jf+pOHvTKcIPd9tdkI2zLvjJ8mqTEhcsA+sxOEnkeWy
 6zHUEqSXwbh4zb5iQzemIgZCGhufWwCWQ1W6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B49d4SIox+e+mb7jQzvkFTKZpAevCiiZS2mIDlEpl4k=;
 b=qrTJ/X+f93nCXTZMECh06c8FsaFxUCqGSIkzYWqbpHjM1WRtzOx65avVdt0f9zNkUb
 oFy0f9SNTucehX9wXVFi67KkH+zpIJ0JSPYp8B9JEEcQ427upEDPPLUBzIZrD0lJE1ZE
 rRb9wUm2KydM/FgbtXkD5vBKGlnvdqIIXMQvjFC6pxnPhDeQxeu02udPxH8+NUm6vJ4v
 0xM5Ksl5TvHtn09cXO/buj7KcmwZqGiv93IW1lIKXS0LYThMZu7Ua3t+hg9ibIezgvDu
 TWGHM1Xj1scy2R+NuediD0h7VrEn7AcAnPf12RKKFP1ro6V5529v++Sj9ozVfP6kWOqm
 4r7g==
X-Gm-Message-State: AJIora8MlrpJq5tv9l/pORuI/a0j+qIO4LuwnaApFqR8of25VmsJ5IL1
 kyS+JHgJrsAJyqe1WbdVrWO9aQ==
X-Google-Smtp-Source: AGRyM1vUdIB+8cpeDYyqckhQRPC0sjPvKxMcaRn3LdvlrufgT7/mPMROzc9F0xJ7lUreCuUBW6WllA==
X-Received: by 2002:a17:902:f646:b0:168:e2da:8931 with SMTP id
 m6-20020a170902f64600b00168e2da8931mr36827774plg.84.1655950324519; 
 Wed, 22 Jun 2022 19:12:04 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com
 (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a170902768600b0016196bd15f4sm6194000pll.15.2022.06.22.19.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 19:12:03 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v5 1/3] ASoC: rockchip: i2s: switch BCLK to GPIO
Date: Thu, 23 Jun 2022 02:11:51 +0000
Message-Id: <20220623021153.587423-2-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
In-Reply-To: <20220623021153.587423-1-judyhsiao@chromium.org>
References: <20220623021153.587423-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
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
Reviewed-by: Brian Norris <briannorris@chromium.org>
---
 sound/soc/rockchip/rockchip_i2s.c | 171 ++++++++++++++++++++++--------
 1 file changed, 124 insertions(+), 47 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 47a3971a9ce1..79d94fbd2550 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -54,8 +54,38 @@ struct rk_i2s_dev {
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
+		ret = pinctrl_select_state(i2s->pinctrl, i2s->bclk_on);
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
+		ret = pinctrl_select_state(i2s->pinctrl, i2s->bclk_off);
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
@@ -92,39 +122,46 @@ static inline struct rk_i2s_dev *to_info(struct snd_soc_dai *dai)
 	return snd_soc_dai_get_drvdata(dai);
 }
 
-static void rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
+static int rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
 {
 	unsigned int val = 0;
 	int retry = 10;
-
+	int ret = 0;
+	
 	spin_lock(&i2s->lock);
 	if (on) {
-		regmap_update_bits(i2s->regmap, I2S_DMACR,
-				   I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_ENABLE);
-
-		regmap_update_bits(i2s->regmap, I2S_XFER,
-				   I2S_XFER_TXS_START | I2S_XFER_RXS_START,
-				   I2S_XFER_TXS_START | I2S_XFER_RXS_START);
-
+		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
+					 I2S_DMACR_TDE_ENABLE,
+					 I2S_DMACR_TDE_ENABLE);
+		if (ret < 0)
+			goto end;
+		ret = regmap_update_bits(i2s->regmap, I2S_XFER,
+					 I2S_XFER_TXS_START | I2S_XFER_RXS_START,
+					 I2S_XFER_TXS_START | I2S_XFER_RXS_START);
+		if (ret < 0)
+			goto end;
 		i2s->tx_start = true;
 	} else {
 		i2s->tx_start = false;
 
-		regmap_update_bits(i2s->regmap, I2S_DMACR,
-				   I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_DISABLE);
+		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
+					 I2S_DMACR_TDE_ENABLE,
+					 I2S_DMACR_TDE_DISABLE);
+		if (ret < 0)
+			goto end;
 
 		if (!i2s->rx_start) {
-			regmap_update_bits(i2s->regmap, I2S_XFER,
-					   I2S_XFER_TXS_START |
-					   I2S_XFER_RXS_START,
-					   I2S_XFER_TXS_STOP |
-					   I2S_XFER_RXS_STOP);
-
+			ret = regmap_update_bits(i2s->regmap, I2S_XFER,
+						 I2S_XFER_TXS_START | I2S_XFER_RXS_START,
+						 I2S_XFER_TXS_STOP | I2S_XFER_RXS_STOP);
+			if (ret < 0)
+				goto end;
 			udelay(150);
-			regmap_update_bits(i2s->regmap, I2S_CLR,
-					   I2S_CLR_TXC | I2S_CLR_RXC,
-					   I2S_CLR_TXC | I2S_CLR_RXC);
-
+			ret = regmap_update_bits(i2s->regmap, I2S_CLR,
+						 I2S_CLR_TXC | I2S_CLR_RXC,
+						 I2S_CLR_TXC | I2S_CLR_RXC);
+			if (ret < 0)
+				goto end;
 			regmap_read(i2s->regmap, I2S_CLR, &val);
 
 			/* Should wait for clear operation to finish */
@@ -138,42 +175,55 @@ static void rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
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
-				   I2S_DMACR_RDE_ENABLE, I2S_DMACR_RDE_ENABLE);
-
-		regmap_update_bits(i2s->regmap, I2S_XFER,
-				   I2S_XFER_TXS_START | I2S_XFER_RXS_START,
-				   I2S_XFER_TXS_START | I2S_XFER_RXS_START);
-
+		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
+					 I2S_DMACR_RDE_ENABLE,
+					 I2S_DMACR_RDE_ENABLE);
+		if (ret < 0)
+			goto end;
+
+		ret = regmap_update_bits(i2s->regmap, I2S_XFER,
+					 I2S_XFER_TXS_START | I2S_XFER_RXS_START,
+					 I2S_XFER_TXS_START | I2S_XFER_RXS_START);
+		if (ret < 0)
+			goto end;
 		i2s->rx_start = true;
 	} else {
 		i2s->rx_start = false;
 
-		regmap_update_bits(i2s->regmap, I2S_DMACR,
-				   I2S_DMACR_RDE_ENABLE, I2S_DMACR_RDE_DISABLE);
+		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
+					 I2S_DMACR_RDE_ENABLE,
+					 I2S_DMACR_RDE_DISABLE);
+		if (ret < 0)
+			goto end;
 
 		if (!i2s->tx_start) {
-			regmap_update_bits(i2s->regmap, I2S_XFER,
-					   I2S_XFER_TXS_START |
-					   I2S_XFER_RXS_START,
-					   I2S_XFER_TXS_STOP |
-					   I2S_XFER_RXS_STOP);
-
+			ret = regmap_update_bits(i2s->regmap, I2S_XFER,
+						 I2S_XFER_TXS_START | I2S_XFER_RXS_START,
+						 I2S_XFER_TXS_STOP | I2S_XFER_RXS_STOP);
+			if (ret < 0)
+				goto end;
 			udelay(150);
-			regmap_update_bits(i2s->regmap, I2S_CLR,
-					   I2S_CLR_TXC | I2S_CLR_RXC,
-					   I2S_CLR_TXC | I2S_CLR_RXC);
-
+			ret = regmap_update_bits(i2s->regmap, I2S_CLR,
+						 I2S_CLR_TXC | I2S_CLR_RXC,
+						 I2S_CLR_TXC | I2S_CLR_RXC);
+			if (ret < 0)
+				goto end;
 			regmap_read(i2s->regmap, I2S_CLR, &val);
 
 			/* Should wait for clear operation to finish */
@@ -187,7 +237,12 @@ static void rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
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
@@ -425,17 +480,25 @@ static int rockchip_i2s_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
-			rockchip_snd_rxctrl(i2s, 1);
+			ret = rockchip_snd_rxctrl(i2s, 1);
 		else
-			rockchip_snd_txctrl(i2s, 1);
+			ret = rockchip_snd_txctrl(i2s, 1);
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
@@ -736,6 +799,20 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 	}
 
 	i2s->bclk_ratio = 64;
+	i2s->pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (IS_ERR(i2s->pinctrl)) {
+		dev_err(&pdev->dev, "failed to find i2s pinctrl\n");
+	} else {
+		i2s->bclk_on = pinctrl_lookup_state(i2s->pinctrl, "bclk_on");
+		if (!IS_ERR_OR_NULL(i2s->bclk_on)) {
+			i2s->bclk_off = pinctrl_lookup_state(i2s->pinctrl, "bclk_off");
+			if (IS_ERR_OR_NULL(i2s->bclk_off)) {
+				dev_err(&pdev->dev, "failed to find i2s bclk_off\n");
+				goto err_clk;
+			}
+		}
+		i2s_pinctrl_select_bclk_off(i2s);
+	}
 
 	dev_set_drvdata(&pdev->dev, i2s);
 
-- 
2.37.0.rc0.104.g0611611a94-goog

