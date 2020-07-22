Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEF3229653
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 12:36:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 592491607;
	Wed, 22 Jul 2020 12:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 592491607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595414211;
	bh=pkbGwkefz4/OzYT5ih8Z9rPEik+sxXbpwqj647TJq6Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lMsxeHEmZ/7r7jOcpPWPPe5nKZvwj4+JaGV/7usEkXQZCQGGmtC6I13tif/PYtPcJ
	 I1azh3TBWedb6pbT+ZcQu6Fyfg+P9yRpr/7rzvNZ1ObJUXvjD5LRkBphlWn9UHEuB/
	 GeCx6B9fdrYtK4i/CArjO82w6DR5ZSxhl+cspdHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A741F802E7;
	Wed, 22 Jul 2020 12:33:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07F30F802E2; Wed, 22 Jul 2020 12:33:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A2F8F802E0
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 12:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A2F8F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="EizZ/t40"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1595413990; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=GIrBYS49WG1Q/Qyx0OGru1+d4a91LV1XeEYzlx1Oxmk=;
 b=EizZ/t40Y2HYvT7zfnAYd7LhRPvZXu2MQS6sOAiBn9MstZh+YNh8uCp7SlKilNbSh2gHS9F+
 qiNj94CntoQVPTxfdxxSkAXDfALh2rK2/5grORSLrxsJlGij39oqt+Ovr08L0xow8w/+ze2K
 m/s3E60gtTTdmqyprxH8L1CRPgs=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-east-1.postgun.com with SMTP id
 5f1815e1d3d6508422569192 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Jul 2020 10:33:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0D7ABC433AD; Wed, 22 Jul 2020 10:33:04 +0000 (UTC)
Received: from rohkumar-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1EEC7C433B2;
 Wed, 22 Jul 2020 10:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1EEC7C433B2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rohitkr@codeaurora.org
From: Rohit kumar <rohitkr@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 05/12] ASoC: qcom: lpass: Use regmap_field for i2sctl and
 dmactl registers
Date: Wed, 22 Jul 2020 16:01:48 +0530
Message-Id: <1595413915-17867-6-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
Cc: Rohit kumar <rohitkr@codeaurora.org>
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

I2SCTL and DMACTL registers has different bits alignment for newer
LPASS variants of SC7180 soc. Use REG_FIELD_ID() to define the
reg_fields in platform specific file and removed shifts and mask
macros for such registers from header file.

Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
---
 sound/soc/qcom/lpass-apq8016.c   |  24 ++++++
 sound/soc/qcom/lpass-cpu.c       | 156 ++++++++++++++++++++++++++------------
 sound/soc/qcom/lpass-ipq806x.c   |  24 ++++++
 sound/soc/qcom/lpass-lpaif-reg.h | 157 +++++++++++++++++++++------------------
 sound/soc/qcom/lpass-platform.c  | 145 ++++++++++++++++++++++++++++--------
 sound/soc/qcom/lpass.h           |  53 +++++++++++++
 6 files changed, 407 insertions(+), 152 deletions(-)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index fe4c258..dd9e3dd 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -240,6 +240,30 @@ static struct lpass_variant apq8016_data = {
 	.wrdma_reg_stride	= 0x1000,
 	.wrdma_channel_start	= 5,
 	.wrdma_channels		= 2,
+	.loopback		= REG_FIELD_ID(0x1000, 15, 15, 4, 0x1000),
+	.spken			= REG_FIELD_ID(0x1000, 14, 14, 4, 0x1000),
+	.spkmode		= REG_FIELD_ID(0x1000, 10, 13, 4, 0x1000),
+	.spkmono		= REG_FIELD_ID(0x1000, 9, 9, 4, 0x1000),
+	.micen			= REG_FIELD_ID(0x1000, 8, 8, 4, 0x1000),
+	.micmode		= REG_FIELD_ID(0x1000, 4, 7, 4, 0x1000),
+	.micmono		= REG_FIELD_ID(0x1000, 3, 3, 4, 0x1000),
+	.wssrc			= REG_FIELD_ID(0x1000, 2, 2, 4, 0x1000),
+	.bitwidth		= REG_FIELD_ID(0x1000, 0, 0, 4, 0x1000),
+
+	.rdma_dyncclk		= REG_FIELD_ID(0x8400, 12, 12, 2, 0x1000),
+	.rdma_bursten		= REG_FIELD_ID(0x8400, 11, 11, 2, 0x1000),
+	.rdma_wpscnt		= REG_FIELD_ID(0x8400, 8, 10, 2, 0x1000),
+	.rdma_intf		= REG_FIELD_ID(0x8400, 4, 7, 2, 0x1000),
+	.rdma_fifowm		= REG_FIELD_ID(0x8400, 1, 3, 2, 0x1000),
+	.rdma_enable		= REG_FIELD_ID(0x8400, 0, 0, 2, 0x1000),
+
+	.wrdma_dyncclk		= REG_FIELD_ID(0xB000, 12, 12, 2, 0x1000),
+	.wrdma_bursten		= REG_FIELD_ID(0xB000, 11, 11, 2, 0x1000),
+	.wrdma_wpscnt		= REG_FIELD_ID(0xB000, 8, 10, 2, 0x1000),
+	.wrdma_intf		= REG_FIELD_ID(0xB000, 4, 7, 2, 0x1000),
+	.wrdma_fifowm		= REG_FIELD_ID(0xB000, 1, 3, 2, 0x1000),
+	.wrdma_enable		= REG_FIELD_ID(0xB000, 0, 0, 2, 0x1000),
+
 	.clk_name		= (const char*[]) {
 				   "pcnoc-mport-clk",
 				   "pcnoc-sway-clk",
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index f0c7e93..6b86f16 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -29,6 +29,32 @@
 #define LPASS_CPU_I2S_SD0_1_2_MASK	GENMASK(2, 0)
 #define LPASS_CPU_I2S_SD0_1_2_3_MASK	GENMASK(3, 0)
 
+static int lpass_cpu_init_i2sctl_bitfields(struct device *dev,
+			struct lpaif_i2sctl *i2sctl, struct regmap *map)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	struct lpass_variant *v = drvdata->variant;
+
+	i2sctl->loopback = devm_regmap_field_alloc(dev, map, v->loopback);
+	i2sctl->spken = devm_regmap_field_alloc(dev, map, v->spken);
+	i2sctl->spkmode = devm_regmap_field_alloc(dev, map, v->spkmode);
+	i2sctl->spkmono = devm_regmap_field_alloc(dev, map, v->spkmono);
+	i2sctl->micen = devm_regmap_field_alloc(dev, map, v->micen);
+	i2sctl->micmode = devm_regmap_field_alloc(dev, map, v->micmode);
+	i2sctl->micmono = devm_regmap_field_alloc(dev, map, v->micmono);
+	i2sctl->wssrc = devm_regmap_field_alloc(dev, map, v->wssrc);
+	i2sctl->bitwidth = devm_regmap_field_alloc(dev, map, v->bitwidth);
+
+	if (IS_ERR(i2sctl->loopback) || IS_ERR(i2sctl->spken) ||
+	    IS_ERR(i2sctl->spkmode) || IS_ERR(i2sctl->spkmono) ||
+	    IS_ERR(i2sctl->micen) || IS_ERR(i2sctl->micmode) ||
+	    IS_ERR(i2sctl->micmono) || IS_ERR(i2sctl->wssrc) ||
+	    IS_ERR(i2sctl->bitwidth))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int lpass_cpu_daiops_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 		unsigned int freq, int dir)
 {
@@ -79,6 +105,8 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 		struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
+	unsigned int id = dai->driver->id;
 	snd_pcm_format_t format = params_format(params);
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
@@ -92,28 +120,45 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 		return bitwidth;
 	}
 
-	regval = LPAIF_I2SCTL_LOOPBACK_DISABLE |
-			LPAIF_I2SCTL_WSSRC_INTERNAL;
+	ret = regmap_fields_write(i2sctl->loopback, id,
+				 LPAIF_I2SCTL_LOOPBACK_DISABLE);
+	if (ret) {
+		dev_err(dai->dev, "error updating loopback field: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_fields_write(i2sctl->wssrc, id,
+				 LPAIF_I2SCTL_WSSRC_INTERNAL);
+	if (ret) {
+		dev_err(dai->dev, "error updating wssrc field: %d\n", ret);
+		return ret;
+	}
 
 	switch (bitwidth) {
 	case 16:
-		regval |= LPAIF_I2SCTL_BITWIDTH_16;
+		regval = LPAIF_I2SCTL_BITWIDTH_16;
 		break;
 	case 24:
-		regval |= LPAIF_I2SCTL_BITWIDTH_24;
+		regval = LPAIF_I2SCTL_BITWIDTH_24;
 		break;
 	case 32:
-		regval |= LPAIF_I2SCTL_BITWIDTH_32;
+		regval = LPAIF_I2SCTL_BITWIDTH_32;
 		break;
 	default:
 		dev_err(dai->dev, "invalid bitwidth given: %d\n", bitwidth);
 		return -EINVAL;
 	}
 
+	ret = regmap_fields_write(i2sctl->bitwidth, id, regval);
+	if (ret) {
+		dev_err(dai->dev, "error updating bitwidth field: %d\n", ret);
+		return ret;
+	}
+
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		mode = drvdata->mi2s_playback_sd_mode[dai->driver->id];
+		mode = drvdata->mi2s_playback_sd_mode[id];
 	else
-		mode = drvdata->mi2s_capture_sd_mode[dai->driver->id];
+		mode = drvdata->mi2s_capture_sd_mode[id];
 
 	if (!mode) {
 		dev_err(dai->dev, "no line is assigned\n");
@@ -175,30 +220,42 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		regval |= LPAIF_I2SCTL_SPKMODE(mode);
-
+		ret = regmap_fields_write(i2sctl->spkmode, id,
+					 LPAIF_I2SCTL_SPKMODE(mode));
+		if (ret) {
+			dev_err(dai->dev, "error writing to i2sctl spkr mode: %d\n",
+				ret);
+			return ret;
+		}
 		if (channels >= 2)
-			regval |= LPAIF_I2SCTL_SPKMONO_STEREO;
+			ret = regmap_fields_write(i2sctl->spkmono, id,
+						 LPAIF_I2SCTL_SPKMONO_STEREO);
 		else
-			regval |= LPAIF_I2SCTL_SPKMONO_MONO;
+			ret = regmap_fields_write(i2sctl->spkmono, id,
+						 LPAIF_I2SCTL_SPKMONO_MONO);
 	} else {
-		regval |= LPAIF_I2SCTL_MICMODE(mode);
-
+		ret = regmap_fields_write(i2sctl->micmode, id,
+					 LPAIF_I2SCTL_MICMODE(mode));
+		if (ret) {
+			dev_err(dai->dev, "error writing to i2sctl mic mode: %d\n",
+				ret);
+			return ret;
+		}
 		if (channels >= 2)
-			regval |= LPAIF_I2SCTL_MICMONO_STEREO;
+			ret = regmap_fields_write(i2sctl->micmono, id,
+						 LPAIF_I2SCTL_MICMONO_STEREO);
 		else
-			regval |= LPAIF_I2SCTL_MICMONO_MONO;
+			ret = regmap_fields_write(i2sctl->micmono, id,
+						 LPAIF_I2SCTL_MICMONO_MONO);
 	}
 
-	ret = regmap_write(drvdata->lpaif_map,
-			   LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
-			   regval);
 	if (ret) {
-		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
+		dev_err(dai->dev, "error writing to i2sctl channels mode: %d\n",
+			ret);
 		return ret;
 	}
 
-	ret = clk_set_rate(drvdata->mi2s_bit_clk[dai->driver->id],
+	ret = clk_set_rate(drvdata->mi2s_bit_clk[id],
 			   rate * bitwidth * 2);
 	if (ret) {
 		dev_err(dai->dev, "error setting mi2s bitclk to %u: %d\n",
@@ -228,22 +285,20 @@ static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
+	unsigned int id = dai->driver->id;
 	int ret;
-	unsigned int val, mask;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		val = LPAIF_I2SCTL_SPKEN_ENABLE;
-		mask = LPAIF_I2SCTL_SPKEN_MASK;
-	} else  {
-		val = LPAIF_I2SCTL_MICEN_ENABLE;
-		mask = LPAIF_I2SCTL_MICEN_MASK;
+		ret = regmap_fields_write(i2sctl->spken, id,
+					 LPAIF_I2SCTL_SPKEN_ENABLE);
+	} else {
+		ret = regmap_fields_write(i2sctl->micen, id,
+					 LPAIF_I2SCTL_MICEN_ENABLE);
 	}
 
-	ret = regmap_update_bits(drvdata->lpaif_map,
-			LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
-			mask, val);
 	if (ret)
-		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
+		dev_err(dai->dev, "error writing to i2sctl enable: %d\n", ret);
 
 	return ret;
 }
@@ -252,25 +307,21 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 		int cmd, struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
+	unsigned int id = dai->driver->id;
 	int ret = -EINVAL;
-	unsigned int val, mask;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			val = LPAIF_I2SCTL_SPKEN_ENABLE;
-			mask = LPAIF_I2SCTL_SPKEN_MASK;
+			ret = regmap_fields_write(i2sctl->spken, id,
+						 LPAIF_I2SCTL_SPKEN_ENABLE);
 		} else  {
-			val = LPAIF_I2SCTL_MICEN_ENABLE;
-			mask = LPAIF_I2SCTL_MICEN_MASK;
+			ret = regmap_fields_write(i2sctl->micen, id,
+						 LPAIF_I2SCTL_MICEN_ENABLE);
 		}
-
-		ret = regmap_update_bits(drvdata->lpaif_map,
-				LPAIF_I2SCTL_REG(drvdata->variant,
-						dai->driver->id),
-				mask, val);
 		if (ret)
 			dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
 				ret);
@@ -279,17 +330,12 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			val = LPAIF_I2SCTL_SPKEN_DISABLE;
-			mask = LPAIF_I2SCTL_SPKEN_MASK;
+			ret = regmap_fields_write(i2sctl->spken, id,
+						 LPAIF_I2SCTL_SPKEN_DISABLE);
 		} else  {
-			val = LPAIF_I2SCTL_MICEN_DISABLE;
-			mask = LPAIF_I2SCTL_MICEN_MASK;
+			ret = regmap_fields_write(i2sctl->micen, id,
+						 LPAIF_I2SCTL_MICEN_DISABLE);
 		}
-
-		ret = regmap_update_bits(drvdata->lpaif_map,
-				LPAIF_I2SCTL_REG(drvdata->variant,
-						dai->driver->id),
-				mask, val);
 		if (ret)
 			dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
 				ret);
@@ -599,6 +645,18 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Allocation for i2sctl regmap fields */
+	drvdata->i2sctl = devm_kzalloc(&pdev->dev, sizeof(struct lpaif_i2sctl),
+					GFP_KERNEL);
+
+	/* Initialize bitfields for dai I2SCTL register */
+	ret = lpass_cpu_init_i2sctl_bitfields(dev, drvdata->i2sctl,
+						drvdata->lpaif_map);
+	if (ret) {
+		dev_err(dev, "error init i2sctl field: %d\n", ret);
+		return ret;
+	}
+
 	ret = devm_snd_soc_register_component(dev,
 					      &lpass_cpu_comp_driver,
 					      variant->dai_driver,
diff --git a/sound/soc/qcom/lpass-ipq806x.c b/sound/soc/qcom/lpass-ipq806x.c
index b7c0586..72f09b3 100644
--- a/sound/soc/qcom/lpass-ipq806x.c
+++ b/sound/soc/qcom/lpass-ipq806x.c
@@ -123,6 +123,30 @@ static struct lpass_variant ipq806x_data = {
 	.wrdma_reg_stride	= 0x1000,
 	.wrdma_channel_start	= 5,
 	.wrdma_channels		= 4,
+	.loopback		= REG_FIELD_ID(0x0010, 15, 15, 5, 0x4),
+	.spken			= REG_FIELD_ID(0x0010, 14, 14, 5, 0x4),
+	.spkmode		= REG_FIELD_ID(0x0010, 10, 13, 5, 0x4),
+	.spkmono		= REG_FIELD_ID(0x0010, 9, 9, 5, 0x4),
+	.micen			= REG_FIELD_ID(0x0010, 8, 8, 5, 0x4),
+	.micmode		= REG_FIELD_ID(0x0010, 4, 7, 5, 0x4),
+	.micmono		= REG_FIELD_ID(0x0010, 3, 3, 5, 0x4),
+	.wssrc			= REG_FIELD_ID(0x0010, 2, 2, 5, 0x4),
+	.bitwidth		= REG_FIELD_ID(0x0010, 0, 0, 5, 0x4),
+
+	.rdma_dyncclk		= REG_FIELD_ID(0x6000, 12, 12, 4, 0x1000),
+	.rdma_bursten		= REG_FIELD_ID(0x6000, 11, 11, 4, 0x1000),
+	.rdma_wpscnt		= REG_FIELD_ID(0x6000, 8, 10, 4, 0x1000),
+	.rdma_intf		= REG_FIELD_ID(0x6000, 4, 7, 4, 0x1000),
+	.rdma_fifowm		= REG_FIELD_ID(0x6000, 1, 3, 4, 0x1000),
+	.rdma_enable		= REG_FIELD_ID(0x6000, 0, 0, 4, 0x1000),
+
+	.wrdma_dyncclk		= REG_FIELD_ID(0xB000, 12, 12, 4, 0x1000),
+	.wrdma_bursten		= REG_FIELD_ID(0xB000, 11, 11, 4, 0x1000),
+	.wrdma_wpscnt		= REG_FIELD_ID(0xB000, 8, 10, 4, 0x1000),
+	.wrdma_intf		= REG_FIELD_ID(0xB000, 4, 7, 4, 0x1000),
+	.wrdma_fifowm		= REG_FIELD_ID(0xB000, 1, 3, 4, 0x1000),
+	.wrdma_enable		= REG_FIELD_ID(0xB000, 0, 0, 4, 0x1000),
+
 	.dai_driver		= &ipq806x_lpass_cpu_dai_driver,
 	.num_dai		= 1,
 	.dai_osr_clk_names	= (const char *[]) {
diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
index 72a3e2f..5258e60 100644
--- a/sound/soc/qcom/lpass-lpaif-reg.h
+++ b/sound/soc/qcom/lpass-lpaif-reg.h
@@ -12,15 +12,12 @@
 	(v->i2sctrl_reg_base + (addr) + v->i2sctrl_reg_stride * (port))
 
 #define LPAIF_I2SCTL_REG(v, port)	LPAIF_I2SCTL_REG_ADDR(v, 0x0, (port))
-#define LPAIF_I2SCTL_LOOPBACK_MASK	0x8000
-#define LPAIF_I2SCTL_LOOPBACK_SHIFT	15
-#define LPAIF_I2SCTL_LOOPBACK_DISABLE	(0 << LPAIF_I2SCTL_LOOPBACK_SHIFT)
-#define LPAIF_I2SCTL_LOOPBACK_ENABLE	(1 << LPAIF_I2SCTL_LOOPBACK_SHIFT)
 
-#define LPAIF_I2SCTL_SPKEN_MASK		0x4000
-#define LPAIF_I2SCTL_SPKEN_SHIFT	14
-#define LPAIF_I2SCTL_SPKEN_DISABLE	(0 << LPAIF_I2SCTL_SPKEN_SHIFT)
-#define LPAIF_I2SCTL_SPKEN_ENABLE	(1 << LPAIF_I2SCTL_SPKEN_SHIFT)
+#define LPAIF_I2SCTL_LOOPBACK_DISABLE	0
+#define LPAIF_I2SCTL_LOOPBACK_ENABLE	1
+
+#define LPAIF_I2SCTL_SPKEN_DISABLE	0
+#define LPAIF_I2SCTL_SPKEN_ENABLE	1
 
 #define LPAIF_I2SCTL_MODE_NONE		0
 #define LPAIF_I2SCTL_MODE_SD0		1
@@ -31,40 +28,37 @@
 #define LPAIF_I2SCTL_MODE_QUAD23	6
 #define LPAIF_I2SCTL_MODE_6CH		7
 #define LPAIF_I2SCTL_MODE_8CH		8
+#define LPAIF_I2SCTL_MODE_10CH		9
+#define LPAIF_I2SCTL_MODE_12CH		10
+#define LPAIF_I2SCTL_MODE_14CH		11
+#define LPAIF_I2SCTL_MODE_16CH		12
+#define LPAIF_I2SCTL_MODE_SD4		13
+#define LPAIF_I2SCTL_MODE_SD5		14
+#define LPAIF_I2SCTL_MODE_SD6		15
+#define LPAIF_I2SCTL_MODE_SD7		16
+#define LPAIF_I2SCTL_MODE_QUAD45	17
+#define LPAIF_I2SCTL_MODE_QUAD47	18
+#define LPAIF_I2SCTL_MODE_8CH_2		19
 
-#define LPAIF_I2SCTL_SPKMODE_MASK	0x3C00
-#define LPAIF_I2SCTL_SPKMODE_SHIFT	10
-#define LPAIF_I2SCTL_SPKMODE(mode)	((mode) << LPAIF_I2SCTL_SPKMODE_SHIFT)
+#define LPAIF_I2SCTL_SPKMODE(mode)	mode
 
-#define LPAIF_I2SCTL_SPKMONO_MASK	0x0200
-#define LPAIF_I2SCTL_SPKMONO_SHIFT	9
-#define LPAIF_I2SCTL_SPKMONO_STEREO	(0 << LPAIF_I2SCTL_SPKMONO_SHIFT)
-#define LPAIF_I2SCTL_SPKMONO_MONO	(1 << LPAIF_I2SCTL_SPKMONO_SHIFT)
+#define LPAIF_I2SCTL_SPKMONO_STEREO	0
+#define LPAIF_I2SCTL_SPKMONO_MONO	1
 
-#define LPAIF_I2SCTL_MICEN_MASK		GENMASK(8, 8)
-#define LPAIF_I2SCTL_MICEN_SHIFT	8
-#define LPAIF_I2SCTL_MICEN_DISABLE	(0 << LPAIF_I2SCTL_MICEN_SHIFT)
-#define LPAIF_I2SCTL_MICEN_ENABLE	(1 << LPAIF_I2SCTL_MICEN_SHIFT)
+#define LPAIF_I2SCTL_MICEN_DISABLE	0
+#define LPAIF_I2SCTL_MICEN_ENABLE	1
 
-#define LPAIF_I2SCTL_MICMODE_MASK	GENMASK(7, 4)
-#define LPAIF_I2SCTL_MICMODE_SHIFT	4
-#define LPAIF_I2SCTL_MICMODE(mode)	((mode) << LPAIF_I2SCTL_MICMODE_SHIFT)
+#define LPAIF_I2SCTL_MICMODE(mode)	mode
 
-#define LPAIF_I2SCTL_MIMONO_MASK	GENMASK(3, 3)
-#define LPAIF_I2SCTL_MICMONO_SHIFT	3
-#define LPAIF_I2SCTL_MICMONO_STEREO	(0 << LPAIF_I2SCTL_MICMONO_SHIFT)
-#define LPAIF_I2SCTL_MICMONO_MONO	(1 << LPAIF_I2SCTL_MICMONO_SHIFT)
+#define LPAIF_I2SCTL_MICMONO_STEREO	0
+#define LPAIF_I2SCTL_MICMONO_MONO	1
 
-#define LPAIF_I2SCTL_WSSRC_MASK		0x0004
-#define LPAIF_I2SCTL_WSSRC_SHIFT	2
-#define LPAIF_I2SCTL_WSSRC_INTERNAL	(0 << LPAIF_I2SCTL_WSSRC_SHIFT)
-#define LPAIF_I2SCTL_WSSRC_EXTERNAL	(1 << LPAIF_I2SCTL_WSSRC_SHIFT)
+#define LPAIF_I2SCTL_WSSRC_INTERNAL	0
+#define LPAIF_I2SCTL_WSSRC_EXTERNAL	1
 
-#define LPAIF_I2SCTL_BITWIDTH_MASK	0x0003
-#define LPAIF_I2SCTL_BITWIDTH_SHIFT	0
-#define LPAIF_I2SCTL_BITWIDTH_16	(0 << LPAIF_I2SCTL_BITWIDTH_SHIFT)
-#define LPAIF_I2SCTL_BITWIDTH_24	(1 << LPAIF_I2SCTL_BITWIDTH_SHIFT)
-#define LPAIF_I2SCTL_BITWIDTH_32	(2 << LPAIF_I2SCTL_BITWIDTH_SHIFT)
+#define LPAIF_I2SCTL_BITWIDTH_16	0
+#define LPAIF_I2SCTL_BITWIDTH_24	1
+#define LPAIF_I2SCTL_BITWIDTH_32	2
 
 /* LPAIF IRQ */
 #define LPAIF_IRQ_REG_ADDR(v, addr, port) \
@@ -121,42 +115,59 @@
 #define	LPAIF_DMAPER_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, PER)
 #define	LPAIF_DMAPERCNT_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, PERCNT)
 
-#define LPAIF_DMACTL_BURSTEN_MASK	0x800
-#define LPAIF_DMACTL_BURSTEN_SHIFT	11
-#define LPAIF_DMACTL_BURSTEN_SINGLE	(0 << LPAIF_DMACTL_BURSTEN_SHIFT)
-#define LPAIF_DMACTL_BURSTEN_INCR4	(1 << LPAIF_DMACTL_BURSTEN_SHIFT)
-
-#define LPAIF_DMACTL_WPSCNT_MASK	0x700
-#define LPAIF_DMACTL_WPSCNT_SHIFT	8
-#define LPAIF_DMACTL_WPSCNT_ONE	(0 << LPAIF_DMACTL_WPSCNT_SHIFT)
-#define LPAIF_DMACTL_WPSCNT_TWO	(1 << LPAIF_DMACTL_WPSCNT_SHIFT)
-#define LPAIF_DMACTL_WPSCNT_THREE	(2 << LPAIF_DMACTL_WPSCNT_SHIFT)
-#define LPAIF_DMACTL_WPSCNT_FOUR	(3 << LPAIF_DMACTL_WPSCNT_SHIFT)
-#define LPAIF_DMACTL_WPSCNT_SIX	(5 << LPAIF_DMACTL_WPSCNT_SHIFT)
-#define LPAIF_DMACTL_WPSCNT_EIGHT	(7 << LPAIF_DMACTL_WPSCNT_SHIFT)
-
-#define LPAIF_DMACTL_AUDINTF_MASK	0x0F0
-#define LPAIF_DMACTL_AUDINTF_SHIFT	4
-#define LPAIF_DMACTL_AUDINTF(id)	(id << LPAIF_DMACTL_AUDINTF_SHIFT)
-
-#define LPAIF_DMACTL_FIFOWM_MASK	0x00E
-#define LPAIF_DMACTL_FIFOWM_SHIFT	1
-#define LPAIF_DMACTL_FIFOWM_1		(0 << LPAIF_DMACTL_FIFOWM_SHIFT)
-#define LPAIF_DMACTL_FIFOWM_2		(1 << LPAIF_DMACTL_FIFOWM_SHIFT)
-#define LPAIF_DMACTL_FIFOWM_3		(2 << LPAIF_DMACTL_FIFOWM_SHIFT)
-#define LPAIF_DMACTL_FIFOWM_4		(3 << LPAIF_DMACTL_FIFOWM_SHIFT)
-#define LPAIF_DMACTL_FIFOWM_5		(4 << LPAIF_DMACTL_FIFOWM_SHIFT)
-#define LPAIF_DMACTL_FIFOWM_6		(5 << LPAIF_DMACTL_FIFOWM_SHIFT)
-#define LPAIF_DMACTL_FIFOWM_7		(6 << LPAIF_DMACTL_FIFOWM_SHIFT)
-#define LPAIF_DMACTL_FIFOWM_8		(7 << LPAIF_DMACTL_FIFOWM_SHIFT)
-
-#define LPAIF_DMACTL_ENABLE_MASK	0x1
-#define LPAIF_DMACTL_ENABLE_SHIFT	0
-#define LPAIF_DMACTL_ENABLE_OFF	(0 << LPAIF_DMACTL_ENABLE_SHIFT)
-#define LPAIF_DMACTL_ENABLE_ON		(1 << LPAIF_DMACTL_ENABLE_SHIFT)
-
-#define LPAIF_DMACTL_DYNCLK_MASK	BIT(12)
-#define LPAIF_DMACTL_DYNCLK_SHIFT	12
-#define LPAIF_DMACTL_DYNCLK_OFF	(0 << LPAIF_DMACTL_DYNCLK_SHIFT)
-#define LPAIF_DMACTL_DYNCLK_ON		(1 << LPAIF_DMACTL_DYNCLK_SHIFT)
+#define LPAIF_DMACTL_BURSTEN_SINGLE	0
+#define LPAIF_DMACTL_BURSTEN_INCR4	1
+
+#define LPAIF_DMACTL_WPSCNT_ONE		0
+#define LPAIF_DMACTL_WPSCNT_TWO		1
+#define LPAIF_DMACTL_WPSCNT_THREE	2
+#define LPAIF_DMACTL_WPSCNT_FOUR	3
+#define LPAIF_DMACTL_WPSCNT_SIX		5
+#define LPAIF_DMACTL_WPSCNT_EIGHT	7
+#define LPAIF_DMACTL_WPSCNT_TEN		9
+#define LPAIF_DMACTL_WPSCNT_TWELVE	11
+#define LPAIF_DMACTL_WPSCNT_FOURTEEN	13
+#define LPAIF_DMACTL_WPSCNT_SIXTEEN	15
+
+#define LPAIF_DMACTL_AUDINTF(id)	id
+
+#define LPAIF_DMACTL_FIFOWM_1		0
+#define LPAIF_DMACTL_FIFOWM_2		1
+#define LPAIF_DMACTL_FIFOWM_3		2
+#define LPAIF_DMACTL_FIFOWM_4		3
+#define LPAIF_DMACTL_FIFOWM_5		4
+#define LPAIF_DMACTL_FIFOWM_6		5
+#define LPAIF_DMACTL_FIFOWM_7		6
+#define LPAIF_DMACTL_FIFOWM_8		7
+#define LPAIF_DMACTL_FIFOWM_9		8
+#define LPAIF_DMACTL_FIFOWM_10		9
+#define LPAIF_DMACTL_FIFOWM_11		10
+#define LPAIF_DMACTL_FIFOWM_12		11
+#define LPAIF_DMACTL_FIFOWM_13		12
+#define LPAIF_DMACTL_FIFOWM_14		13
+#define LPAIF_DMACTL_FIFOWM_15		14
+#define LPAIF_DMACTL_FIFOWM_16		15
+#define LPAIF_DMACTL_FIFOWM_17		16
+#define LPAIF_DMACTL_FIFOWM_18		17
+#define LPAIF_DMACTL_FIFOWM_19		18
+#define LPAIF_DMACTL_FIFOWM_20		19
+#define LPAIF_DMACTL_FIFOWM_21		20
+#define LPAIF_DMACTL_FIFOWM_22		21
+#define LPAIF_DMACTL_FIFOWM_23		22
+#define LPAIF_DMACTL_FIFOWM_24		23
+#define LPAIF_DMACTL_FIFOWM_25		24
+#define LPAIF_DMACTL_FIFOWM_26		25
+#define LPAIF_DMACTL_FIFOWM_27		26
+#define LPAIF_DMACTL_FIFOWM_28		27
+#define LPAIF_DMACTL_FIFOWM_29		28
+#define LPAIF_DMACTL_FIFOWM_30		29
+#define LPAIF_DMACTL_FIFOWM_31		30
+#define LPAIF_DMACTL_FIFOWM_32		31
+
+#define LPAIF_DMACTL_ENABLE_OFF		0
+#define LPAIF_DMACTL_ENABLE_ON		1
+
+#define LPAIF_DMACTL_DYNCLK_OFF		0
+#define LPAIF_DMACTL_DYNCLK_ON		1
+
 #endif /* __LPASS_LPAIF_REG_H__ */
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index b195f3d..249c7e6 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -50,6 +50,53 @@ static const struct snd_pcm_hardware lpass_platform_pcm_hardware = {
 	.fifo_size		=	0,
 };
 
+static int lpass_platform_alloc_dmactl_fields(struct device *dev,
+					 struct regmap *map)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	struct lpass_variant *v = drvdata->variant;
+	struct lpaif_dmactl *rd_dmactl, *wr_dmactl;
+
+	drvdata->rd_dmactl = devm_kzalloc(dev, sizeof(struct lpaif_dmactl),
+					  GFP_KERNEL);
+	if (drvdata->rd_dmactl == NULL)
+		return -ENOMEM;
+
+	drvdata->wr_dmactl = devm_kzalloc(dev, sizeof(struct lpaif_dmactl),
+					  GFP_KERNEL);
+	if (drvdata->wr_dmactl == NULL)
+		return -ENOMEM;
+
+	rd_dmactl = drvdata->rd_dmactl;
+	wr_dmactl = drvdata->wr_dmactl;
+
+	rd_dmactl->bursten = devm_regmap_field_alloc(dev, map, v->rdma_bursten);
+	rd_dmactl->wpscnt = devm_regmap_field_alloc(dev, map, v->rdma_wpscnt);
+	rd_dmactl->fifowm = devm_regmap_field_alloc(dev, map, v->rdma_fifowm);
+	rd_dmactl->intf = devm_regmap_field_alloc(dev, map, v->rdma_intf);
+	rd_dmactl->enable = devm_regmap_field_alloc(dev, map, v->rdma_enable);
+	rd_dmactl->dyncclk = devm_regmap_field_alloc(dev, map, v->rdma_dyncclk);
+
+	if (IS_ERR(rd_dmactl->bursten) || IS_ERR(rd_dmactl->wpscnt) ||
+	    IS_ERR(rd_dmactl->fifowm) || IS_ERR(rd_dmactl->intf) ||
+	    IS_ERR(rd_dmactl->enable) || IS_ERR(rd_dmactl->dyncclk))
+		return -EINVAL;
+
+	wr_dmactl->bursten = devm_regmap_field_alloc(dev, map, v->wrdma_bursten);
+	wr_dmactl->wpscnt = devm_regmap_field_alloc(dev, map, v->wrdma_wpscnt);
+	wr_dmactl->fifowm = devm_regmap_field_alloc(dev, map, v->wrdma_fifowm);
+	wr_dmactl->intf = devm_regmap_field_alloc(dev, map, v->wrdma_intf);
+	wr_dmactl->enable = devm_regmap_field_alloc(dev, map, v->wrdma_enable);
+	wr_dmactl->dyncclk = devm_regmap_field_alloc(dev, map, v->wrdma_dyncclk);
+
+	if (IS_ERR(wr_dmactl->bursten) || IS_ERR(wr_dmactl->wpscnt) ||
+	    IS_ERR(wr_dmactl->fifowm) || IS_ERR(wr_dmactl->intf) ||
+	    IS_ERR(wr_dmactl->enable) || IS_ERR(wr_dmactl->dyncclk))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 				      struct snd_pcm_substream *substream)
 {
@@ -134,11 +181,18 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	snd_pcm_format_t format = params_format(params);
 	unsigned int channels = params_channels(params);
 	unsigned int regval;
-	int ch, dir = substream->stream;
+	struct lpaif_dmactl *dmactl;
+	int id, dir = substream->stream;
 	int bitwidth;
 	int ret, dma_port = pcm_data->i2s_port + v->dmactl_audif_start;
 
-	ch = pcm_data->dma_ch;
+	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
+		dmactl = drvdata->rd_dmactl;
+		id = pcm_data->dma_ch;
+	} else {
+		dmactl = drvdata->wr_dmactl;
+		id = pcm_data->dma_ch - v->wrdma_channel_start;
+	}
 
 	bitwidth = snd_pcm_format_width(format);
 	if (bitwidth < 0) {
@@ -147,25 +201,39 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 		return bitwidth;
 	}
 
-	regval = LPAIF_DMACTL_BURSTEN_INCR4 |
-			LPAIF_DMACTL_AUDINTF(dma_port) |
-			LPAIF_DMACTL_FIFOWM_8;
+	ret = regmap_fields_write(dmactl->bursten, id, LPAIF_DMACTL_BURSTEN_INCR4);
+	if (ret) {
+		dev_err(soc_runtime->dev, "error updating bursten field: %d\n", ret);
+		return ret;
+	}
+
+	regmap_fields_write(dmactl->fifowm, id, LPAIF_DMACTL_FIFOWM_8);
+	if (ret) {
+		dev_err(soc_runtime->dev, "error updating fifowm field: %d\n", ret);
+		return ret;
+	}
+
+	regmap_fields_write(dmactl->intf, id, LPAIF_DMACTL_AUDINTF(dma_port));
+	if (ret) {
+		dev_err(soc_runtime->dev, "error updating audintf field: %d\n", ret);
+		return ret;
+	}
 
 	switch (bitwidth) {
 	case 16:
 		switch (channels) {
 		case 1:
 		case 2:
-			regval |= LPAIF_DMACTL_WPSCNT_ONE;
+			regval = LPAIF_DMACTL_WPSCNT_ONE;
 			break;
 		case 4:
-			regval |= LPAIF_DMACTL_WPSCNT_TWO;
+			regval = LPAIF_DMACTL_WPSCNT_TWO;
 			break;
 		case 6:
-			regval |= LPAIF_DMACTL_WPSCNT_THREE;
+			regval = LPAIF_DMACTL_WPSCNT_THREE;
 			break;
 		case 8:
-			regval |= LPAIF_DMACTL_WPSCNT_FOUR;
+			regval = LPAIF_DMACTL_WPSCNT_FOUR;
 			break;
 		default:
 			dev_err(soc_runtime->dev,
@@ -178,19 +246,19 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	case 32:
 		switch (channels) {
 		case 1:
-			regval |= LPAIF_DMACTL_WPSCNT_ONE;
+			regval = LPAIF_DMACTL_WPSCNT_ONE;
 			break;
 		case 2:
-			regval |= LPAIF_DMACTL_WPSCNT_TWO;
+			regval = LPAIF_DMACTL_WPSCNT_TWO;
 			break;
 		case 4:
-			regval |= LPAIF_DMACTL_WPSCNT_FOUR;
+			regval = LPAIF_DMACTL_WPSCNT_FOUR;
 			break;
 		case 6:
-			regval |= LPAIF_DMACTL_WPSCNT_SIX;
+			regval = LPAIF_DMACTL_WPSCNT_SIX;
 			break;
 		case 8:
-			regval |= LPAIF_DMACTL_WPSCNT_EIGHT;
+			regval = LPAIF_DMACTL_WPSCNT_EIGHT;
 			break;
 		default:
 			dev_err(soc_runtime->dev,
@@ -205,10 +273,9 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	ret = regmap_write(drvdata->lpaif_map,
-			LPAIF_DMACTL_REG(v, ch, dir), regval);
+	ret = regmap_fields_write(dmactl->wpscnt, id, regval);
 	if (ret) {
-		dev_err(soc_runtime->dev, "error writing to rdmactl reg: %d\n",
+		dev_err(soc_runtime->dev, "error writing to dmactl reg: %d\n",
 			ret);
 		return ret;
 	}
@@ -245,9 +312,17 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
 	struct lpass_variant *v = drvdata->variant;
-	int ret, ch, dir = substream->stream;
+	struct lpaif_dmactl *dmactl;
+	int ret, id, ch, dir = substream->stream;
 
 	ch = pcm_data->dma_ch;
+	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
+		dmactl = drvdata->rd_dmactl;
+		id = pcm_data->dma_ch;
+	} else {
+		dmactl = drvdata->wr_dmactl;
+		id = pcm_data->dma_ch - v->wrdma_channel_start;
+	}
 
 	ret = regmap_write(drvdata->lpaif_map,
 			LPAIF_DMABASE_REG(v, ch, dir),
@@ -276,9 +351,7 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
 		return ret;
 	}
 
-	ret = regmap_update_bits(drvdata->lpaif_map,
-			LPAIF_DMACTL_REG(v, ch, dir),
-			LPAIF_DMACTL_ENABLE_MASK, LPAIF_DMACTL_ENABLE_ON);
+	ret = regmap_fields_write(dmactl->enable, id, LPAIF_DMACTL_ENABLE_ON);
 	if (ret) {
 		dev_err(soc_runtime->dev, "error writing to rdmactl reg: %d\n",
 			ret);
@@ -297,9 +370,18 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
 	struct lpass_variant *v = drvdata->variant;
-	int ret, ch, dir = substream->stream;
+	struct lpaif_dmactl *dmactl;
+	int ret, ch, id;
+	int dir = substream->stream;
 
 	ch = pcm_data->dma_ch;
+	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
+		dmactl = drvdata->rd_dmactl;
+		id = pcm_data->dma_ch;
+	} else {
+		dmactl = drvdata->wr_dmactl;
+		id = pcm_data->dma_ch - v->wrdma_channel_start;
+	}
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -325,10 +407,8 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 			return ret;
 		}
 
-		ret = regmap_update_bits(drvdata->lpaif_map,
-				LPAIF_DMACTL_REG(v, ch, dir),
-				LPAIF_DMACTL_ENABLE_MASK,
-				LPAIF_DMACTL_ENABLE_ON);
+		ret = regmap_fields_write(dmactl->enable, id,
+					 LPAIF_DMACTL_ENABLE_ON);
 		if (ret) {
 			dev_err(soc_runtime->dev,
 				"error writing to rdmactl reg: %d\n", ret);
@@ -338,10 +418,8 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		ret = regmap_update_bits(drvdata->lpaif_map,
-				LPAIF_DMACTL_REG(v, ch, dir),
-				LPAIF_DMACTL_ENABLE_MASK,
-				LPAIF_DMACTL_ENABLE_OFF);
+		ret = regmap_fields_write(dmactl->enable, id,
+					 LPAIF_DMACTL_ENABLE_OFF);
 		if (ret) {
 			dev_err(soc_runtime->dev,
 				"error writing to rdmactl reg: %d\n", ret);
@@ -580,6 +658,13 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = lpass_platform_alloc_dmactl_fields(&pdev->dev,
+						 drvdata->lpaif_map);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"error initializing dmactl fields: %d\n", ret);
+		return ret;
+	}
 
 	return devm_snd_soc_register_component(&pdev->dev,
 			&lpass_component_driver, NULL, 0);
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 450020e..51c9991 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -17,6 +17,28 @@
 #define LPASS_MAX_MI2S_PORTS			(8)
 #define LPASS_MAX_DMA_CHANNELS			(8)
 
+struct lpaif_i2sctl {
+	struct regmap_field *loopback;
+	struct regmap_field *spken;
+	struct regmap_field *spkmode;
+	struct regmap_field *spkmono;
+	struct regmap_field *micen;
+	struct regmap_field *micmode;
+	struct regmap_field *micmono;
+	struct regmap_field *wssrc;
+	struct regmap_field *bitwidth;
+};
+
+
+struct lpaif_dmactl {
+	struct regmap_field *bursten;
+	struct regmap_field *wpscnt;
+	struct regmap_field *intf;
+	struct regmap_field *fifowm;
+	struct regmap_field *enable;
+	struct regmap_field *dyncclk;
+};
+
 /* Both the CPU DAI and platform drivers will access this data */
 struct lpass_data {
 
@@ -55,6 +77,10 @@ struct lpass_data {
 	struct clk_bulk_data *clks;
 	int num_clks;
 
+	/* Regmap fields of I2SCTL & DMACTL registers bitfields */
+	struct lpaif_i2sctl *i2sctl;
+	struct lpaif_dmactl *rd_dmactl;
+	struct lpaif_dmactl *wr_dmactl;
 };
 
 /* Vairant data per each SOC */
@@ -72,6 +98,33 @@ struct lpass_variant {
 	u32	wrdma_reg_stride;
 	u32	wrdma_channels;
 
+	/* I2SCTL Register fields */
+	struct reg_field loopback;
+	struct reg_field spken;
+	struct reg_field spkmode;
+	struct reg_field spkmono;
+	struct reg_field micen;
+	struct reg_field micmode;
+	struct reg_field micmono;
+	struct reg_field wssrc;
+	struct reg_field bitwidth;
+
+	/* RD_DMA Register fields */
+	struct reg_field rdma_bursten;
+	struct reg_field rdma_wpscnt;
+	struct reg_field rdma_intf;
+	struct reg_field rdma_fifowm;
+	struct reg_field rdma_enable;
+	struct reg_field rdma_dyncclk;
+
+	/* WR_DMA Register fields */
+	struct reg_field wrdma_bursten;
+	struct reg_field wrdma_wpscnt;
+	struct reg_field wrdma_intf;
+	struct reg_field wrdma_fifowm;
+	struct reg_field wrdma_enable;
+	struct reg_field wrdma_dyncclk;
+
 	/**
 	 * on SOCs like APQ8016 the channel control bits start
 	 * at different offset to ipq806x
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

