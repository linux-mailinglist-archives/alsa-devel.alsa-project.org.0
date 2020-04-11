Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8D11A752D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 09:49:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDC6416A0;
	Tue, 14 Apr 2020 09:49:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDC6416A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586850593;
	bh=XIJY+ylGQb8l64tHliLt+BOacV5z9Hojho7BihIY8Kg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bC9BWLySoPrVHRCoUSBOwsdAsgDfCP1D5SZxNPX8COvMfserdqy3mKWFSCAP4dhwZ
	 jSfLMMVR5lqefaaVsnNcgkER0NGFs5G2ymWwfVFk7/lJs7sLA2JROZI60Sgame4K1K
	 JTrtTrj1XLIUEZ5GWe5ne9Ar2kKyekBLh7+sHSEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97645F802F7;
	Tue, 14 Apr 2020 09:42:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEEE9F800CB; Sat, 11 Apr 2020 10:04:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34FEBF801DA
 for <alsa-devel@alsa-project.org>; Sat, 11 Apr 2020 10:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34FEBF801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="pxjkv5gf"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586592272; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Bnz6MJ/qFfPiLKy+tJVoenTR3jVnJA77P0RTyIyn02s=;
 b=pxjkv5gfs5DRPnbtOMMDYs1d4gR6T9JrKsmEisit4GvEa4E9/mmfzRH4jzAhjOF1QGhfrfVg
 a02k6tSMxQyT9b5LaAA0wXO67zIQuLvfBQS7c9Zuxcg6TCD7b2dMTQQn2A/R25TZvULO6t+h
 33BJYOc5/r2zQzzQd93lVv57IPQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e917a0f.7f76be345998-smtp-out-n05;
 Sat, 11 Apr 2020 08:04:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B96CDC43636; Sat, 11 Apr 2020 08:04:30 +0000 (UTC)
Received: from c-ajitp-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ajitp)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B1E94C433CB;
 Sat, 11 Apr 2020 08:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B1E94C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=ajitp@codeaurora.org
From: Ajit Pandey <ajitp@codeaurora.org>
To: alsa-devel@alsa-project.org, broonie@kernel.org,
 devicetree@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 srinivas.kandagatla@linaro.org
Subject: [PATCH 08/11] ASoC: qcom : lpass: Add support to configure dai's
 connection mode
Date: Sat, 11 Apr 2020 13:32:48 +0530
Message-Id: <1586592171-31644-9-git-send-email-ajitp@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
References: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
X-Mailman-Approved-At: Tue, 14 Apr 2020 09:41:47 +0200
Cc: Ajit Pandey <ajitp@codeaurora.org>, linux-kernel@vger.kernel.org,
 tiwai@suse.com
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

Few dai configuration depends on board layout and use cases. Add new
variables in dai_data to configure dai modes based on values defined
in device tree configuration of board.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
---
 sound/soc/qcom/lpass-cpu.c | 70 ++++++++++++++++++++++++++++++++++++++++++++--
 sound/soc/qcom/lpass.h     |  6 ++++
 2 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 006ba5a..f96338f 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -90,8 +90,9 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 		return bitwidth;
 	}
 
-	regval = LPAIF_I2SCTL(v, LOOPBACK_DISABLE);
-	regval |= LPAIF_I2SCTL(v, WSSRC_INTERNAL);
+	/* default to Loopback disable & wssrc internal */
+	regval = dai_data->loopback << (LPAIF_I2SCTL(v, LOOPBACK_SHIFT));
+	regval |= dai_data->wssrc << (LPAIF_I2SCTL(v, WSSRC_SHIFT));
 
 	switch (bitwidth) {
 	case 16:
@@ -172,6 +173,28 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
+	/* Overwrite spk & mic mode bits with device tree value if specified */
+	if (dai_data->spkmode != 0) {
+		regval = dai_data->spkmode << (LPAIF_I2SCTL(v, SPKMODE_SHIFT));
+		ret = regmap_update_bits(drvdata->lpaif_map,
+			LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
+			LPAIF_I2SCTL(v, SPKMODE_MASK), regval);
+		if (ret)
+			dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
+				ret);
+	}
+
+
+	if (dai_data->micmode != 0) {
+		regval = dai_data->micmode << (LPAIF_I2SCTL(v, MICMODE_SHIFT));
+		ret = regmap_update_bits(drvdata->lpaif_map,
+			LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
+			LPAIF_I2SCTL(v, MICMODE_MASK), regval);
+		if (ret)
+			dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
+				ret);
+	}
+
 	ret = clk_set_rate(dai_data->bit_clk, rate * bitwidth * 2);
 	if (ret) {
 		dev_err(dai->dev, "error setting mi2s bitclk to %u: %d\n",
@@ -423,6 +446,46 @@ static bool lpass_cpu_regmap_volatile(struct device *dev, unsigned int reg)
 	.cache_type = REGCACHE_FLAT,
 };
 
+static void of_qcom_parse_dai_data(struct device *dev,
+				    struct lpass_data *drvdata)
+{
+	struct device_node *node;
+	struct lpass_dai *dai;
+	int ret;
+
+	for_each_child_of_node(dev->of_node, node) {
+		int id;
+
+		ret = of_property_read_u32(node, "id", &id);
+		if (ret || id < 0 || id >= LPASS_MAX_MI2S_PORTS) {
+			dev_err(dev, "valid dai id not found:%d\n", ret);
+			continue;
+		}
+
+		dai = drvdata->dai_priv[id];
+		switch (id) {
+		case MI2S_PRIMARY... MI2S_QUATERNARY:
+			 /* MI2S specific properties */
+			ret = of_property_read_u32(node, "qcom,spkmode-mask",
+						   &dai->spkmode);
+
+			ret = of_property_read_u32(node, "qcom,micmode-mask",
+						   &dai->micmode);
+
+			ret = of_property_read_u32(node, "qcom,wssrc-mask",
+						   &dai->wssrc);
+
+			ret = of_property_read_u32(node, "qcom,loopback-mask",
+						   &dai->loopback);
+
+			break;
+		default:
+			dev_err(dev, "valid dai not found:%d\n", id);
+			break;
+		}
+	}
+}
+
 static int lpass_init_dai_clocks(struct device *dev,
 			   struct lpass_data *drvdata)
 {
@@ -501,6 +564,9 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 						GFP_KERNEL);
 	}
 
+	/* parse dai data from dts */
+	of_qcom_parse_dai_data(dev, drvdata);
+
 	ret = lpass_init_dai_clocks(dev, drvdata);
 	if (ret) {
 		dev_err(&pdev->dev, "error intializing dai clock: %d\n", ret);
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 384f4b8..960ee97 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -12,6 +12,7 @@
 #include <linux/compiler.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <dt-bindings/sound/qcom,lpass.h>
 
 #define LPASS_AHBIX_CLOCK_FREQUENCY            131072000
 #define LPASS_MAX_MI2S_PORTS                   (8)
@@ -23,6 +24,11 @@
 struct lpass_dai {
 	struct clk *osr_clk;
 	struct clk *bit_clk;
+
+	uint32_t spkmode;
+	uint32_t micmode;
+	uint32_t wssrc;
+	uint32_t loopback;
 };
 
 /* Both the CPU DAI and platform drivers will access this data */
-- 
1.9.1
