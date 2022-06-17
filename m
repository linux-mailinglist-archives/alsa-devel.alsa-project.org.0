Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4DD54F052
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 06:44:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A1EA1B61;
	Fri, 17 Jun 2022 06:43:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A1EA1B61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655441079;
	bh=1pYYsJyvtYbhECyuAzO24za3qMNB+20eIsb3DVw0YBg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bHBXATaptnXogyWQessGKJ6OayvV944oKFERc1txMdKOeKPhA8J0zS7lvS2vhxSab
	 MgXk67tD5sG7R+jtMQdqg9psg/7RhNKwVZ/xltk88FVd+rfRRIXrxt01ECKAM3PKFG
	 SCitvvj7vWMW7H8VBKtfHehyyRafQLXVJa6AIF1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9B08F80311;
	Fri, 17 Jun 2022 06:43:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E54ECF80311; Fri, 17 Jun 2022 06:43:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D223F800D3
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 06:43:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D223F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="C1RImj30"
Received: by mail-pl1-x62f.google.com with SMTP id m14so2929141plg.5
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 21:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7qm0AV+eEkYcioHyqrZmg4KTKdUKCTL+PHt2XXgTZN4=;
 b=C1RImj30Vr0KSWg4SrSlti9tJXEp0BuR9xbh/Nu2FVRRHeWR9Wfm0oRxYmVMWoBxC+
 5WB31Po3TPMST4rq1bjOVr0x0Zcf1xANG3obmQW+0/IaIqUwKxo4bcacX/keCxvMjdqr
 d3SqtUbWHUe3DYv0YhGEzmlgqXOPoKVkJCO50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7qm0AV+eEkYcioHyqrZmg4KTKdUKCTL+PHt2XXgTZN4=;
 b=vM1wTEGRXaP9mMwV7n7cDAqUFnaaBGFpHIxEXwGVvNip6tCp+gH758TTca+cjk4NFy
 fVDWYpgF9bnqkhXFGtxCiBiRQv3bLsYiD3vPh9Lu9k2sq5PxnA8u7IXUq9vIPacKExnn
 95s8cHgQeV9ad7ALPtgSeE/CoT7n20HLZfd/zsp5PIT+5u8JWfDAQ1sdVIim/tNgYvAM
 dHcuESymLa9+f3DmuG9rExvVNljhfnfCZ35yTDkqEpltQgahM0ogI6AIgvynDuA1ENj5
 fbnWtHV0LN04noCdTz6ggiN0pZNurKluEYboIxwD88YYyFS8YO4fjAlQEmqwIyhnLjQq
 gjrw==
X-Gm-Message-State: AJIora+zX76pVbUe7xg6JrKvfzMEVi+UEfUdbnBzlZNsPtMYahBH0Aj2
 2QG9lZgUezwUg3h2lqPpzoQ/jg==
X-Google-Smtp-Source: AGRyM1u47Xwd9C4J12AwhST7whGJZczwk3OeT+Nq150Gu/wrM/gCORce+SkGdAaiCNARdWwEzokGBQ==
X-Received: by 2002:a17:902:f708:b0:153:839f:bf2c with SMTP id
 h8-20020a170902f70800b00153839fbf2cmr8037455plo.113.1655440981674; 
 Thu, 16 Jun 2022 21:43:01 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com
 (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a17090a778800b001eab0a27d92sm4491030pjk.51.2022.06.16.21.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 21:43:01 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v3 1/3] ASoC: rockchip: i2s: switch BCLK to GPIO
Date: Fri, 17 Jun 2022 04:42:49 +0000
Message-Id: <20220617044251.4029697-2-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220617044251.4029697-1-judyhsiao@chromium.org>
References: <20220616155836.3401420-1-judyhsiao@chromium.org>
 <20220617044251.4029697-1-judyhsiao@chromium.org>
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

We discovered that the state of BCLK on, LRCLK off and SD_MODE on
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
---
 sound/soc/rockchip/rockchip_i2s.c | 167 ++++++++++++++++++++++--------
 1 file changed, 121 insertions(+), 46 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 47a3971a9ce1..5e3cb06377a1 100644
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
+			I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_ENABLE);
+		if (ret < 0)
+			goto end;
+		ret = regmap_update_bits(i2s->regmap, I2S_XFER,
+			I2S_XFER_TXS_START | I2S_XFER_RXS_START,
+			I2S_XFER_TXS_START | I2S_XFER_RXS_START);
+		if (ret < 0)
+			goto end;
 		i2s->tx_start = true;
 	} else {
 		i2s->tx_start = false;
 
-		regmap_update_bits(i2s->regmap, I2S_DMACR,
-				   I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_DISABLE);
+		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
+			I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_DISABLE);
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
+				I2S_XFER_TXS_START |
+				I2S_XFER_RXS_START,
+				I2S_XFER_TXS_STOP |
+				I2S_XFER_RXS_STOP);
+			if (ret < 0)
+				goto end;
 			udelay(150);
-			regmap_update_bits(i2s->regmap, I2S_CLR,
-					   I2S_CLR_TXC | I2S_CLR_RXC,
-					   I2S_CLR_TXC | I2S_CLR_RXC);
-
+			ret = regmap_update_bits(i2s->regmap, I2S_CLR,
+				I2S_CLR_TXC | I2S_CLR_RXC,
+				I2S_CLR_TXC | I2S_CLR_RXC);
+			if (ret < 0)
+				goto end;
 			regmap_read(i2s->regmap, I2S_CLR, &val);
 
 			/* Should wait for clear operation to finish */
@@ -138,42 +175,53 @@ static void rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
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
 
 static void rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
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
+			I2S_DMACR_RDE_ENABLE, I2S_DMACR_RDE_ENABLE);
+		if (ret < 0)
+			goto end;
+
+		ret = regmap_update_bits(i2s->regmap, I2S_XFER,
+			I2S_XFER_TXS_START | I2S_XFER_RXS_START,
+			I2S_XFER_TXS_START | I2S_XFER_RXS_START);
+		if (ret < 0)
+			goto end;
 		i2s->rx_start = true;
 	} else {
 		i2s->rx_start = false;
 
-		regmap_update_bits(i2s->regmap, I2S_DMACR,
-				   I2S_DMACR_RDE_ENABLE, I2S_DMACR_RDE_DISABLE);
+		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
+			I2S_DMACR_RDE_ENABLE, I2S_DMACR_RDE_DISABLE);
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
+				I2S_XFER_TXS_START | I2S_XFER_RXS_START,
+				I2S_XFER_TXS_STOP | I2S_XFER_RXS_STOP);
+			if (ret < 0)
+				goto end;
 			udelay(150);
-			regmap_update_bits(i2s->regmap, I2S_CLR,
-					   I2S_CLR_TXC | I2S_CLR_RXC,
-					   I2S_CLR_TXC | I2S_CLR_RXC);
-
+			ret = regmap_update_bits(i2s->regmap, I2S_CLR,
+				I2S_CLR_TXC | I2S_CLR_RXC,
+				I2S_CLR_TXC | I2S_CLR_RXC);
+			if (ret < 0)
+				goto end;
 			regmap_read(i2s->regmap, I2S_CLR, &val);
 
 			/* Should wait for clear operation to finish */
@@ -187,7 +235,12 @@ static void rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
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
@@ -425,17 +478,25 @@ static int rockchip_i2s_trigger(struct snd_pcm_substream *substream,
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
@@ -736,6 +797,20 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 	}
 
 	i2s->bclk_ratio = 64;
+	i2s->pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (IS_ERR(i2s->pinctrl))
+		dev_err(&pdev->dev, "failed to find i2s pinctrl\n");
+
+	i2s->bclk_on = pinctrl_lookup_state(i2s->pinctrl, "bclk_on");
+	if (!IS_ERR_OR_NULL(i2s->bclk_on)) {
+		i2s->bclk_off = pinctrl_lookup_state(i2s->pinctrl, "bclk_off");
+		if (IS_ERR_OR_NULL(i2s->bclk_off)) {
+			dev_err(&pdev->dev, "failed to find i2s bclk_off\n");
+			goto err_clk;
+		}
+	}
+
+	i2s_pinctrl_select_bclk_off(i2s);
 
 	dev_set_drvdata(&pdev->dev, i2s);
 
-- 
2.36.1.476.g0c4daa206d-goog

