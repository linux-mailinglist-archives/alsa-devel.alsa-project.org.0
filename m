Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC333F8174
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 06:04:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92A2F1685;
	Thu, 26 Aug 2021 06:04:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92A2F1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629950697;
	bh=hiPVBYjnf4wJQ1UZegft4iUOiFiGHIw1g/x2/pJa9OU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jhrwmi1Pulv4YxtyILe9W0u9szJfzRMg/v8vDt6VxLzqxAKDegK2nFLvvRbXByC5K
	 Ahm3B7rzB2hveXLkuWpHzdOknteTKkw8OFJ0V04EsJXq/EDNbrmFoko9bTJ/AcmQrf
	 9YTk4cfHcAYcg5ptsOGxm0rCrkCScslgwr1w0e/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 184FDF804EB;
	Thu, 26 Aug 2021 06:03:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D04BF804FC; Thu, 26 Aug 2021 06:03:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.135])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0AE0F804EB
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 06:02:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0AE0F804EB
Received: from localhost (unknown [192.168.167.70])
 by lucky1.263xmail.com (Postfix) with ESMTP id B4225B2F31;
 Thu, 26 Aug 2021 12:02:51 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P22778T140142501164800S1629950564011175_; 
 Thu, 26 Aug 2021 12:02:51 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <b848bf4361b3454f5ba33631047c257d>
X-RL-SENDER: sugar.zhang@rock-chips.com
X-SENDER: zxg@rock-chips.com
X-LOGIN-NAME: sugar.zhang@rock-chips.com
X-FST-TO: broonie@kernel.org
X-RCPT-COUNT: 6
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Sugar Zhang <sugar.zhang@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de
Subject: [PATCH v3 09/14] ASoC: rockchip: i2s: Make playback/capture optional
Date: Thu, 26 Aug 2021 12:02:37 +0800
Message-Id: <1629950562-14281-4-git-send-email-sugar.zhang@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629950441-14118-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1629950441-14118-1-git-send-email-sugar.zhang@rock-chips.com>
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
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

There are some controllers which support playback only or
capture only. so, make it optional. and initial capability
by 'dma-names' of DT.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
---

Changes in v3:
- Drop property 'rockchip,playback-only', 'rockchip,capture-only'.
  Implement it by 'dma-names' of DT instead.

Changes in v2: None

 sound/soc/rockchip/rockchip_i2s.c | 129 +++++++++++++++++++++++---------------
 1 file changed, 79 insertions(+), 50 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 15e2690..c0b3960 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -44,6 +44,9 @@ struct rk_i2s_dev {
 	struct reset_control *reset_m;
 	struct reset_control *reset_h;
 
+	bool has_capture;
+	bool has_playback;
+
 /*
  * Used to indicate the tx/rx status.
  * I2S controller hopes to start the tx and rx together,
@@ -478,8 +481,9 @@ static int rockchip_i2s_dai_probe(struct snd_soc_dai *dai)
 {
 	struct rk_i2s_dev *i2s = snd_soc_dai_get_drvdata(dai);
 
-	dai->capture_dma_data = &i2s->capture_dma_data;
-	dai->playback_dma_data = &i2s->playback_dma_data;
+	snd_soc_dai_init_dma_data(dai,
+		i2s->has_playback ? &i2s->playback_dma_data : NULL,
+		i2s->has_capture  ? &i2s->capture_dma_data  : NULL);
 
 	return 0;
 }
@@ -494,28 +498,6 @@ static const struct snd_soc_dai_ops rockchip_i2s_dai_ops = {
 
 static struct snd_soc_dai_driver rockchip_i2s_dai = {
 	.probe = rockchip_i2s_dai_probe,
-	.playback = {
-		.stream_name = "Playback",
-		.channels_min = 2,
-		.channels_max = 8,
-		.rates = SNDRV_PCM_RATE_8000_192000,
-		.formats = (SNDRV_PCM_FMTBIT_S8 |
-			    SNDRV_PCM_FMTBIT_S16_LE |
-			    SNDRV_PCM_FMTBIT_S20_3LE |
-			    SNDRV_PCM_FMTBIT_S24_LE |
-			    SNDRV_PCM_FMTBIT_S32_LE),
-	},
-	.capture = {
-		.stream_name = "Capture",
-		.channels_min = 2,
-		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_192000,
-		.formats = (SNDRV_PCM_FMTBIT_S8 |
-			    SNDRV_PCM_FMTBIT_S16_LE |
-			    SNDRV_PCM_FMTBIT_S20_3LE |
-			    SNDRV_PCM_FMTBIT_S24_LE |
-			    SNDRV_PCM_FMTBIT_S32_LE),
-	},
 	.ops = &rockchip_i2s_dai_ops,
 	.symmetric_rate = 1,
 };
@@ -620,16 +602,84 @@ static const struct of_device_id rockchip_i2s_match[] __maybe_unused = {
 	{},
 };
 
+static int rockchip_i2s_init_dai(struct rk_i2s_dev *i2s, struct resource *res,
+				 struct snd_soc_dai_driver **dp)
+{
+	struct device_node *node = i2s->dev->of_node;
+	struct snd_soc_dai_driver *dai;
+	struct property *dma_names;
+	const char *dma_name;
+	unsigned int val;
+
+	of_property_for_each_string(node, "dma-names", dma_names, dma_name) {
+		if (!strcmp(dma_name, "tx"))
+			i2s->has_playback = true;
+		if (!strcmp(dma_name, "rx"))
+			i2s->has_capture = true;
+	}
+
+	dai = devm_kmemdup(i2s->dev, &rockchip_i2s_dai,
+			   sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	if (i2s->has_playback) {
+		dai->playback.stream_name = "Playback";
+		dai->playback.channels_min = 2;
+		dai->playback.channels_max = 8;
+		dai->playback.rates = SNDRV_PCM_RATE_8000_192000;
+		dai->playback.formats = SNDRV_PCM_FMTBIT_S8 |
+					SNDRV_PCM_FMTBIT_S16_LE |
+					SNDRV_PCM_FMTBIT_S20_3LE |
+					SNDRV_PCM_FMTBIT_S24_LE |
+					SNDRV_PCM_FMTBIT_S32_LE;
+
+		i2s->playback_dma_data.addr = res->start + I2S_TXDR;
+		i2s->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		i2s->playback_dma_data.maxburst = 8;
+
+		if (!of_property_read_u32(node, "rockchip,playback-channels", &val)) {
+			if (val >= 2 && val <= 8)
+				dai->playback.channels_max = val;
+		}
+	}
+
+	if (i2s->has_capture) {
+		dai->capture.stream_name = "Capture";
+		dai->capture.channels_min = 2;
+		dai->capture.channels_max = 8;
+		dai->capture.rates = SNDRV_PCM_RATE_8000_192000;
+		dai->capture.formats = SNDRV_PCM_FMTBIT_S8 |
+				       SNDRV_PCM_FMTBIT_S16_LE |
+				       SNDRV_PCM_FMTBIT_S20_3LE |
+				       SNDRV_PCM_FMTBIT_S24_LE |
+				       SNDRV_PCM_FMTBIT_S32_LE;
+
+		i2s->capture_dma_data.addr = res->start + I2S_RXDR;
+		i2s->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		i2s->capture_dma_data.maxburst = 8;
+
+		if (!of_property_read_u32(node, "rockchip,capture-channels", &val)) {
+			if (val >= 2 && val <= 8)
+				dai->capture.channels_max = val;
+		}
+	}
+
+	if (dp)
+		*dp = dai;
+
+	return 0;
+}
+
 static int rockchip_i2s_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
 	const struct of_device_id *of_id;
 	struct rk_i2s_dev *i2s;
-	struct snd_soc_dai_driver *soc_dai;
+	struct snd_soc_dai_driver *dai;
 	struct resource *res;
 	void __iomem *regs;
 	int ret;
-	int val;
 
 	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
 	if (!i2s)
@@ -684,14 +734,6 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 		return PTR_ERR(i2s->regmap);
 	}
 
-	i2s->playback_dma_data.addr = res->start + I2S_TXDR;
-	i2s->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	i2s->playback_dma_data.maxburst = 8;
-
-	i2s->capture_dma_data.addr = res->start + I2S_RXDR;
-	i2s->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	i2s->capture_dma_data.maxburst = 8;
-
 	i2s->bclk_ratio = 64;
 
 	dev_set_drvdata(&pdev->dev, i2s);
@@ -703,26 +745,13 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 			goto err_pm_disable;
 	}
 
-	soc_dai = devm_kmemdup(&pdev->dev, &rockchip_i2s_dai,
-			       sizeof(*soc_dai), GFP_KERNEL);
-	if (!soc_dai) {
-		ret = -ENOMEM;
+	ret = rockchip_i2s_init_dai(i2s, res, &dai);
+	if (ret)
 		goto err_pm_disable;
-	}
-
-	if (!of_property_read_u32(node, "rockchip,playback-channels", &val)) {
-		if (val >= 2 && val <= 8)
-			soc_dai->playback.channels_max = val;
-	}
-
-	if (!of_property_read_u32(node, "rockchip,capture-channels", &val)) {
-		if (val >= 2 && val <= 8)
-			soc_dai->capture.channels_max = val;
-	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &rockchip_i2s_component,
-					      soc_dai, 1);
+					      dai, 1);
 
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI\n");
-- 
2.7.4



