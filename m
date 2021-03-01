Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7478F32868D
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 18:12:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C54C1696;
	Mon,  1 Mar 2021 18:12:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C54C1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614618776;
	bh=pxCQjssLoxZcatELQgwjllNaDYthflzhU0aVN0lbGBg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cKzajyq1BXFeFhvLvELTrOfa24WQ2foWs1dbc58bpiQFPtbWzvELgl35hJLKVp0xu
	 z/yVFdbBfhuBnh+ECgV24StgJFO+EtvfjvhrzZaNapwl1YTkwp3ggDAAEE1ya6Jbpy
	 lS6rx87vy/QDvwiirsp224B8O+wamsS8pAmW0UWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA568F80475;
	Mon,  1 Mar 2021 18:09:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DAF7F80430; Mon,  1 Mar 2021 18:09:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89866F80423
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 18:09:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89866F80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="d55wQBvM"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1614618591; x=1646154591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pxCQjssLoxZcatELQgwjllNaDYthflzhU0aVN0lbGBg=;
 b=d55wQBvMAYu+0//AnsqeFQqYcWqnV3G2voizjfBEZYr4G8jUu2worte8
 bzTOLchKkCaBkVj1RfsgoQd3Vmpa7sSW0uzaKqQCSPScousUB4a9oZgqH
 1VS7Ga4ktwwuo2wn70tj1vsngqRCZCSjjAnBKwrEb1Uh2xnMUOomjkccH
 AZjGpTUxvBOLwS88dwPmGdu4BYLNIVJs3vemSbPIxHtR1gB7NNXPXT9Gg
 +4hRJNvNx/iCtWi8uHTWxWPbSExr7H43h5Igz1GBpxjAIvEQpMtRaz/gd
 4G8Shju7Q2JA42L2ewDjBfzq7qgUPmEoT/jlrATBUNflEjFhs6vn6l9Fg g==;
IronPort-SDR: yPPwN8AecrDgMrQElqI1xdlSNlqrA/CjJCNWt9DWdGllpwcTvelEooZyPhAR1R+YxnuDrZDIx9
 vj43uYQQ9J90j7i8vbwMlk4Ir05k6Xg05qMpAHGl4nZSAf5JIylXk9UrW0xkEWYfaN9P9LGfyf
 2Hm0rjmKk+wVIiX+AlAOCHxXXl1P5lEdpIiRgjmhbJ33P89/bg/xakx2gnsCN46l7PkJm44NSA
 PCLLJRE40qhljv6H43wlsaP9Umcys5TB7tygf+ROCZyWyKvFMLff4JLLiWq4XA5CcProx9oa5C
 gbs=
X-IronPort-AV: E=Sophos;i="5.81,215,1610434800"; d="scan'208";a="111511710"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2021 10:09:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 1 Mar 2021 10:09:45 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 1 Mar 2021 10:09:42 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 3/7] ASoC: mchp-i2s-mcc: Add multi-channel support for I2S
 and LEFT_J formats
Date: Mon, 1 Mar 2021 19:09:01 +0200
Message-ID: <20210301170905.835091-4-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210301170905.835091-1-codrin.ciubotariu@microchip.com>
References: <20210301170905.835091-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
 nicolas.ferre@microchip.com, robh+dt@kernel.org, tiwai@suse.com,
 ludovic.desroches@microchip.com, broonie@kernel.org, Codrin
 Ciubotariu <codrin.ciubotariu@microchip.com>
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

The latest I2S-MCC available in SAMA7G5 supports multi-channel for I2S and
Left-Justified formats. For this, the new version uses 8 (4 * 2) input and
output pins, with each pin being responsible for 2 channels. This sums up
to a total of 8 channels for synchronous capture and playback.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

Changes in v2:
- none

 sound/soc/atmel/mchp-i2s-mcc.c | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 0ee01383e307..52d3f43148dc 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -16,6 +16,7 @@
 #include <linux/clk.h>
 #include <linux/mfd/syscon.h>
 #include <linux/lcm.h>
+#include <linux/of_device.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -225,6 +226,10 @@ static const struct regmap_config mchp_i2s_mcc_regmap_config = {
 	.max_register = MCHP_I2SMCC_VERSION,
 };
 
+struct mchp_i2s_mcc_soc_data {
+	unsigned int	data_pin_pair_num;
+};
+
 struct mchp_i2s_mcc_dev {
 	struct wait_queue_head			wq_txrdy;
 	struct wait_queue_head			wq_rxrdy;
@@ -232,6 +237,7 @@ struct mchp_i2s_mcc_dev {
 	struct regmap				*regmap;
 	struct clk				*pclk;
 	struct clk				*gclk;
+	const struct mchp_i2s_mcc_soc_data	*soc;
 	struct snd_dmaengine_dai_dma_data	playback;
 	struct snd_dmaengine_dai_dma_data	capture;
 	unsigned int				fmt;
@@ -549,6 +555,17 @@ static int mchp_i2s_mcc_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	if (dev->fmt & (SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_LEFT_J)) {
+		/* for I2S and LEFT_J one pin is needed for every 2 channels */
+		if (channels > dev->soc->data_pin_pair_num * 2) {
+			dev_err(dev->dev,
+				"unsupported number of audio channels: %d\n",
+				channels);
+			return -EINVAL;
+		}
+
+		/* enable for interleaved format */
+		mrb |= MCHP_I2SMCC_MRB_CRAMODE_REGULAR;
+
 		switch (channels) {
 		case 1:
 			if (is_playback)
@@ -558,6 +575,12 @@ static int mchp_i2s_mcc_hw_params(struct snd_pcm_substream *substream,
 			break;
 		case 2:
 			break;
+		case 4:
+			mra |= MCHP_I2SMCC_MRA_WIRECFG_I2S_2_TDM_1;
+			break;
+		case 8:
+			mra |= MCHP_I2SMCC_MRA_WIRECFG_I2S_4_TDM_2;
+			break;
 		default:
 			dev_err(dev->dev, "unsupported number of audio channels\n");
 			return -EINVAL;
@@ -869,12 +892,22 @@ static const struct snd_soc_component_driver mchp_i2s_mcc_component = {
 };
 
 #ifdef CONFIG_OF
+static struct mchp_i2s_mcc_soc_data mchp_i2s_mcc_sam9x60 = {
+	.data_pin_pair_num = 1,
+};
+
+static struct mchp_i2s_mcc_soc_data mchp_i2s_mcc_sama7g5 = {
+	.data_pin_pair_num = 4,
+};
+
 static const struct of_device_id mchp_i2s_mcc_dt_ids[] = {
 	{
 		.compatible = "microchip,sam9x60-i2smcc",
+		.data = &mchp_i2s_mcc_sam9x60,
 	},
 	{
 		.compatible = "microchip,sama7g5-i2smcc",
+		.data = &mchp_i2s_mcc_sama7g5,
 	},
 	{ /* sentinel */ }
 };
@@ -932,6 +965,11 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 		dev->gclk = NULL;
 	}
 
+	dev->soc = of_device_get_match_data(&pdev->dev);
+	if (!dev->soc) {
+		dev_err(&pdev->dev, "failed to get soc data\n");
+		return -ENODEV;
+	}
 	dev->dev = &pdev->dev;
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
-- 
2.27.0

