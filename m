Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1940B1D36D6
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 18:43:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B375D1614;
	Thu, 14 May 2020 18:43:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B375D1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589474633;
	bh=oDvGpScxELw9FexDc8jqniaYvGsXx3yUoh0noTP18vk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SYWm2OSj1j/eZbEz3OitZ+h6HCTWSvuImZnsRIfa5JvAcfXmgwqUTfYERf6tUKMzQ
	 1LA1BPawgAe8UZ5IBc+Wq6Rh6zR2ltxNXMQ230nImpKljfjE75sg6TAq4cvhLaEVzT
	 pvmpZweX08uskecLEJ7jj1Ci0D6958q3L2KiWnc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 036D0F802C2;
	Thu, 14 May 2020 18:40:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9537CF802BE; Thu, 14 May 2020 18:40:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA9A2F802A1
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 18:40:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA9A2F802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="F61Nv/hW"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589474429; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=76g0mSerITPslgNlR5sbNeUEE2qB6xhiYFFGOKlAUFQ=;
 b=F61Nv/hWzdxkd3arqPRh/ldV+dpyH32Z67Oi3JF253w7H6u8LTgSjg+61l8Ns8QdRWlO6sKs
 eSxFRpnJgw8zkIKYLywsIP2NHx4vDzNizWemLCLWt6How1j16r3EGGRzvwVTr3YIevjfeC3t
 59ej0zbLZmrOpFydhrYwEtz/S4A=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebd7471.7fcabc3da0a0-smtp-out-n02;
 Thu, 14 May 2020 16:40:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 84B5DC4478C; Thu, 14 May 2020 16:40:16 +0000 (UTC)
Received: from c-ajitp-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ajitp)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C5B70C43636;
 Thu, 14 May 2020 16:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C5B70C43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=ajitp@codeaurora.org
From: Ajit Pandey <ajitp@codeaurora.org>
To: broonie@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 srinivas.kandagatla@linaro.org
Subject: [PATCH v2 4/7] ASoC: qcom: lpass: Use regmap_field for i2sctl and
 dmactl registers
Date: Thu, 14 May 2020 22:08:15 +0530
Message-Id: <1589474298-29437-5-git-send-email-ajitp@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589474298-29437-1-git-send-email-ajitp@codeaurora.org>
References: <“1586592171-31644-1-git-send-email-ajitp@codeaurora.org”>
 <1589474298-29437-1-git-send-email-ajitp@codeaurora.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Ajit Pandey <ajitp@codeaurora.org>
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
LPASS variants of SC7180 soc. Instead of adding extra overhead for
calculating masks and shifts for newer variants registers layout we
changed the approach to use regmap_field_write() API to update bit.
Such API's will internally do the required bit shift and mask based
on reg_field struct defined for bit fields. We'll define REG_FIELD()
macros with bit layout for both lpass variants and use such macros
to initialize register fields in variant specific driver callbacks.
Also added new bitfieds values for I2SCTL and DMACTL registers and
removed shifts and mask macros for such registers from header file.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
---
 sound/soc/qcom/lpass-apq8016.c   |  61 ++++++++++++
 sound/soc/qcom/lpass-cpu.c       | 114 +++++++++++++---------
 sound/soc/qcom/lpass-lpaif-reg.h | 203 ++++++++++++++++++++++++---------------
 sound/soc/qcom/lpass-platform.c  |  86 +++++++++++------
 sound/soc/qcom/lpass.h           |  30 ++++++
 5 files changed, 340 insertions(+), 154 deletions(-)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 8210e37..3149645 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -124,6 +124,32 @@
 	},
 };
 
+static int apq8016_init_dmactl_bitfields(struct lpaif_dmactl *dmactl,
+					 struct regmap *map,
+					 unsigned int reg)
+{
+	struct reg_field bursten = DMACTL_BURSTEN_FLD(reg);
+	struct reg_field wpscnt = DMACTL_WPSCNT_FLD(reg);
+	struct reg_field fifowm = DMACTL_FIFOWM_FLD(reg);
+	struct reg_field intf = DMACTL_AUDINTF_FLD(reg);
+	struct reg_field enable = DMACTL_ENABLE_FLD(reg);
+	struct reg_field dyncclk = DMACTL_DYNCLK_FLD(reg);
+
+	dmactl->bursten = regmap_field_alloc(map, bursten);
+	dmactl->wpscnt = regmap_field_alloc(map, wpscnt);
+	dmactl->fifowm = regmap_field_alloc(map, fifowm);
+	dmactl->intf = regmap_field_alloc(map, intf);
+	dmactl->enable = regmap_field_alloc(map, enable);
+	dmactl->dyncclk = regmap_field_alloc(map, dyncclk);
+
+	if (IS_ERR(dmactl->bursten) || IS_ERR(dmactl->wpscnt) ||
+	    IS_ERR(dmactl->fifowm) || IS_ERR(dmactl->intf) ||
+	    IS_ERR(dmactl->enable) || IS_ERR(dmactl->dyncclk))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int apq8016_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 					   int direction)
 {
@@ -158,6 +184,39 @@ static int apq8016_lpass_free_dma_channel(struct lpass_data *drvdata, int chan)
 	return 0;
 }
 
+static int sc7180_init_i2sctl_bitfields(struct lpaif_i2sctl *i2sctl,
+					struct regmap *map, unsigned int reg)
+{
+	struct reg_field loopback = I2SCTL_LOOPBACK_FLD(reg);
+	struct reg_field spken = I2SCTL_SPKEN_FLD(reg);
+	struct reg_field spkmode = I2SCTL_SPKMODE_FLD(reg);
+	struct reg_field spkmono = I2SCTL_SPKMONO_FLD(reg);
+	struct reg_field micen = I2SCTL_MICEN_FLD(reg);
+	struct reg_field micmode = I2SCTL_MICMODE_FLD(reg);
+	struct reg_field micmono = I2SCTL_MICMONO_FLD(reg);
+	struct reg_field wssrc = I2SCTL_WSSRC_FLD(reg);
+	struct reg_field bitwidth = I2SCTL_BITWIDTH_FLD(reg);
+
+	i2sctl->loopback = regmap_field_alloc(map, loopback);
+	i2sctl->spken = regmap_field_alloc(map, spken);
+	i2sctl->spkmode = regmap_field_alloc(map, spkmode);
+	i2sctl->spkmono = regmap_field_alloc(map, spkmono);
+	i2sctl->micen = regmap_field_alloc(map, micen);
+	i2sctl->micmode = regmap_field_alloc(map, micmode);
+	i2sctl->micmono = regmap_field_alloc(map, micmono);
+	i2sctl->wssrc = regmap_field_alloc(map, wssrc);
+	i2sctl->bitwidth = regmap_field_alloc(map, bitwidth);
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
 static int apq8016_lpass_init(struct platform_device *pdev)
 {
 	struct lpass_data *drvdata = platform_get_drvdata(pdev);
@@ -236,6 +295,8 @@ static int apq8016_lpass_exit(struct platform_device *pdev)
 	.exit			= apq8016_lpass_exit,
 	.alloc_dma_channel	= apq8016_lpass_alloc_dma_channel,
 	.free_dma_channel	= apq8016_lpass_free_dma_channel,
+	.init_i2sctl_fields	= apq8016_init_i2sctl_bitfields,
+	.init_dmactl_fields	= apq8016_init_dmactl_bitfields,
 };
 
 static const struct of_device_id apq8016_lpass_cpu_device_id[] = {
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 729ca78..ac3c922 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -47,8 +47,18 @@ static int lpass_cpu_daiops_startup(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl[dai->driver->id];
+	struct lpass_variant *v = drvdata->variant;
 	int ret;
 
+	/* Initialize bitfields for dai I2SCTL register */
+	ret = v->init_i2sctl_fields(i2sctl, drvdata->lpaif_map,
+				    LPAIF_I2SCTL_REG(v, dai->driver->id));
+	if (ret) {
+		dev_err(dai->dev, "error init i2sctl field: %d\n", ret);
+		return ret;
+	}
+
 	ret = clk_prepare_enable(drvdata->mi2s_osr_clk[dai->driver->id]);
 	if (ret) {
 		dev_err(dai->dev, "error in enabling mi2s osr clk: %d\n", ret);
@@ -79,11 +89,11 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 		struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl[dai->driver->id];
 	snd_pcm_format_t format = params_format(params);
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
 	unsigned int mode;
-	unsigned int regval;
 	int bitwidth, ret;
 
 	bitwidth = snd_pcm_format_width(format);
@@ -92,24 +102,41 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 		return bitwidth;
 	}
 
-	regval = LPAIF_I2SCTL_LOOPBACK_DISABLE |
-			LPAIF_I2SCTL_WSSRC_INTERNAL;
+	ret = regmap_field_write(i2sctl->loopback,
+				 LPAIF_I2SCTL_LOOPBACK_DISABLE);
+	if (ret) {
+		dev_err(dai->dev, "error updating loopback field: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(i2sctl->wssrc,
+				 LPAIF_I2SCTL_WSSRC_INTERNAL);
+	if (ret) {
+		dev_err(dai->dev, "error updating wssrc field: %d\n", ret);
+		return ret;
+	}
 
 	switch (bitwidth) {
 	case 16:
-		regval |= LPAIF_I2SCTL_BITWIDTH_16;
+		bitwidth = LPAIF_I2SCTL_BITWIDTH_16;
 		break;
 	case 24:
-		regval |= LPAIF_I2SCTL_BITWIDTH_24;
+		bitwidth = LPAIF_I2SCTL_BITWIDTH_24;
 		break;
 	case 32:
-		regval |= LPAIF_I2SCTL_BITWIDTH_32;
+		bitwidth = LPAIF_I2SCTL_BITWIDTH_32;
 		break;
 	default:
 		dev_err(dai->dev, "invalid bitwidth given: %d\n", bitwidth);
 		return -EINVAL;
 	}
 
+	ret = regmap_field_write(i2sctl->bitwidth, bitwidth);
+	if (ret) {
+		dev_err(dai->dev, "error updating bitwidth field: %d\n", ret);
+		return ret;
+	}
+
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		mode = drvdata->mi2s_playback_sd_mode[dai->driver->id];
 	else
@@ -175,26 +202,30 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		regval |= LPAIF_I2SCTL_SPKMODE(mode);
+		ret = regmap_field_write(i2sctl->spkmode,
+					 LPAIF_I2SCTL_SPKMODE(mode));
 
 		if (channels >= 2)
-			regval |= LPAIF_I2SCTL_SPKMONO_STEREO;
+			ret = regmap_field_write(i2sctl->spkmono,
+						 LPAIF_I2SCTL_SPKMONO_STEREO);
 		else
-			regval |= LPAIF_I2SCTL_SPKMONO_MONO;
+			ret = regmap_field_write(i2sctl->spkmono,
+						 LPAIF_I2SCTL_SPKMONO_MONO);
 	} else {
-		regval |= LPAIF_I2SCTL_MICMODE(mode);
+		ret = regmap_field_write(i2sctl->micmode,
+					 LPAIF_I2SCTL_MICMODE(mode));
 
 		if (channels >= 2)
-			regval |= LPAIF_I2SCTL_MICMONO_STEREO;
+			ret = regmap_field_write(i2sctl->micmono,
+						 LPAIF_I2SCTL_MICMONO_STEREO);
 		else
-			regval |= LPAIF_I2SCTL_MICMONO_MONO;
+			ret = regmap_field_write(i2sctl->micmono,
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
 
@@ -228,22 +259,19 @@ static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl[dai->driver->id];
 	int ret;
-	unsigned int val, mask;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		val = LPAIF_I2SCTL_SPKEN_ENABLE;
-		mask = LPAIF_I2SCTL_SPKEN_MASK;
-	} else  {
-		val = LPAIF_I2SCTL_MICEN_ENABLE;
-		mask = LPAIF_I2SCTL_MICEN_MASK;
+		ret = regmap_field_write(i2sctl->spken,
+					 LPAIF_I2SCTL_SPKEN_ENABLE);
+	} else {
+		ret = regmap_field_write(i2sctl->micen,
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
@@ -252,25 +280,20 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 		int cmd, struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct lpaif_i2sctl *i2sctl = drvdata->i2sctl[dai->driver->id];
 	int ret = -EINVAL;
-	unsigned int val, mask;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			val = LPAIF_I2SCTL_SPKEN_ENABLE;
-			mask = LPAIF_I2SCTL_SPKEN_MASK;
+			ret = regmap_field_write(i2sctl->spken,
+						 LPAIF_I2SCTL_SPKEN_ENABLE);
 		} else  {
-			val = LPAIF_I2SCTL_MICEN_ENABLE;
-			mask = LPAIF_I2SCTL_MICEN_MASK;
+			ret = regmap_field_write(i2sctl->micen,
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
@@ -279,17 +302,12 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			val = LPAIF_I2SCTL_SPKEN_DISABLE;
-			mask = LPAIF_I2SCTL_SPKEN_MASK;
+			ret = regmap_field_write(i2sctl->spken,
+						 LPAIF_I2SCTL_SPKEN_DISABLE);
 		} else  {
-			val = LPAIF_I2SCTL_MICEN_DISABLE;
-			mask = LPAIF_I2SCTL_MICEN_MASK;
+			ret = regmap_field_write(i2sctl->micen,
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
@@ -592,6 +610,12 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 				PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
 			return PTR_ERR(drvdata->mi2s_bit_clk[dai_id]);
 		}
+
+		/* Allocation for i2sctl regmap fields */
+		drvdata->i2sctl[i] = devm_kzalloc(&pdev->dev,
+						  sizeof(struct lpaif_i2sctl),
+						  GFP_KERNEL);
+
 	}
 
 	drvdata->ahbix_clk = devm_clk_get_optional(dev, "ahbix-clk");
diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
index 72a3e2f..95dde52f 100644
--- a/sound/soc/qcom/lpass-lpaif-reg.h
+++ b/sound/soc/qcom/lpass-lpaif-reg.h
@@ -12,15 +12,16 @@
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
+#define I2SCTL_LOOPBACK_FLD(reg)	REG_FIELD(reg, 15, 15)
+#define I2SCTL_LOOPBACK_V2_FLD(reg)	REG_FIELD(reg, 17, 17)
+#define LPAIF_I2SCTL_LOOPBACK_DISABLE	0
+#define LPAIF_I2SCTL_LOOPBACK_ENABLE	1
+
+#define I2SCTL_SPKEN_FLD(reg)		REG_FIELD(reg, 14, 14)
+#define I2SCTL_SPKEN_V2_FLD(reg)	REG_FIELD(reg, 16, 16)
+#define LPAIF_I2SCTL_SPKEN_DISABLE	0
+#define LPAIF_I2SCTL_SPKEN_ENABLE	1
 
 #define LPAIF_I2SCTL_MODE_NONE		0
 #define LPAIF_I2SCTL_MODE_SD0		1
@@ -31,40 +32,51 @@
 #define LPAIF_I2SCTL_MODE_QUAD23	6
 #define LPAIF_I2SCTL_MODE_6CH		7
 #define LPAIF_I2SCTL_MODE_8CH		8
-
-#define LPAIF_I2SCTL_SPKMODE_MASK	0x3C00
-#define LPAIF_I2SCTL_SPKMODE_SHIFT	10
-#define LPAIF_I2SCTL_SPKMODE(mode)	((mode) << LPAIF_I2SCTL_SPKMODE_SHIFT)
-
-#define LPAIF_I2SCTL_SPKMONO_MASK	0x0200
-#define LPAIF_I2SCTL_SPKMONO_SHIFT	9
-#define LPAIF_I2SCTL_SPKMONO_STEREO	(0 << LPAIF_I2SCTL_SPKMONO_SHIFT)
-#define LPAIF_I2SCTL_SPKMONO_MONO	(1 << LPAIF_I2SCTL_SPKMONO_SHIFT)
-
-#define LPAIF_I2SCTL_MICEN_MASK		GENMASK(8, 8)
-#define LPAIF_I2SCTL_MICEN_SHIFT	8
-#define LPAIF_I2SCTL_MICEN_DISABLE	(0 << LPAIF_I2SCTL_MICEN_SHIFT)
-#define LPAIF_I2SCTL_MICEN_ENABLE	(1 << LPAIF_I2SCTL_MICEN_SHIFT)
-
-#define LPAIF_I2SCTL_MICMODE_MASK	GENMASK(7, 4)
-#define LPAIF_I2SCTL_MICMODE_SHIFT	4
-#define LPAIF_I2SCTL_MICMODE(mode)	((mode) << LPAIF_I2SCTL_MICMODE_SHIFT)
-
-#define LPAIF_I2SCTL_MIMONO_MASK	GENMASK(3, 3)
-#define LPAIF_I2SCTL_MICMONO_SHIFT	3
-#define LPAIF_I2SCTL_MICMONO_STEREO	(0 << LPAIF_I2SCTL_MICMONO_SHIFT)
-#define LPAIF_I2SCTL_MICMONO_MONO	(1 << LPAIF_I2SCTL_MICMONO_SHIFT)
-
-#define LPAIF_I2SCTL_WSSRC_MASK		0x0004
-#define LPAIF_I2SCTL_WSSRC_SHIFT	2
-#define LPAIF_I2SCTL_WSSRC_INTERNAL	(0 << LPAIF_I2SCTL_WSSRC_SHIFT)
-#define LPAIF_I2SCTL_WSSRC_EXTERNAL	(1 << LPAIF_I2SCTL_WSSRC_SHIFT)
-
-#define LPAIF_I2SCTL_BITWIDTH_MASK	0x0003
-#define LPAIF_I2SCTL_BITWIDTH_SHIFT	0
-#define LPAIF_I2SCTL_BITWIDTH_16	(0 << LPAIF_I2SCTL_BITWIDTH_SHIFT)
-#define LPAIF_I2SCTL_BITWIDTH_24	(1 << LPAIF_I2SCTL_BITWIDTH_SHIFT)
-#define LPAIF_I2SCTL_BITWIDTH_32	(2 << LPAIF_I2SCTL_BITWIDTH_SHIFT)
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
+
+#define I2SCTL_SPKMODE_FLD(reg)		REG_FIELD(reg, 10, 13)
+#define I2SCTL_SPKMODE_V2_FLD(reg)	REG_FIELD(reg, 11, 15)
+#define LPAIF_I2SCTL_SPKMODE(mode)	mode
+
+#define I2SCTL_SPKMONO_FLD(reg)		REG_FIELD(reg, 9, 9)
+#define I2SCTL_SPKMONO_V2_FLD(reg)	REG_FIELD(reg, 10, 10)
+#define LPAIF_I2SCTL_SPKMONO_STEREO	0
+#define LPAIF_I2SCTL_SPKMONO_MONO	1
+
+#define I2SCTL_MICEN_FLD(reg)		REG_FIELD(reg, 8, 8)
+#define I2SCTL_MICEN_V2_FLD(reg)	REG_FIELD(reg, 9, 9)
+#define LPAIF_I2SCTL_MICEN_DISABLE	0
+#define LPAIF_I2SCTL_MICEN_ENABLE	1
+
+#define I2SCTL_MICMODE_FLD(reg)		REG_FIELD(reg, 4, 7)
+#define I2SCTL_MICMODE_V2_FLD(reg)	REG_FIELD(reg, 4, 8)
+#define LPAIF_I2SCTL_MICMODE(mode)	mode
+
+#define I2SCTL_MICMONO_FLD(reg)		REG_FIELD(reg, 3, 3)
+#define I2SCTL_MICMONO_V2_FLD(reg)	REG_FIELD(reg, 3, 3)
+#define LPAIF_I2SCTL_MICMONO_STEREO	0
+#define LPAIF_I2SCTL_MICMONO_MONO	1
+
+#define I2SCTL_WSSRC_FLD(reg)		REG_FIELD(reg, 2, 2)
+#define I2SCTL_WSSRC_V2_FLD(reg)	REG_FIELD(reg, 2, 2)
+#define LPAIF_I2SCTL_WSSRC_INTERNAL	0
+#define LPAIF_I2SCTL_WSSRC_EXTERNAL	1
+
+#define I2SCTL_BITWIDTH_FLD(reg)	REG_FIELD(reg, 0, 0)
+#define I2SCTL_BITWIDTH_V2_FLD(reg)	REG_FIELD(reg, 0, 0)
+#define LPAIF_I2SCTL_BITWIDTH_16	0
+#define LPAIF_I2SCTL_BITWIDTH_24	1
+#define LPAIF_I2SCTL_BITWIDTH_32	2
 
 /* LPAIF IRQ */
 #define LPAIF_IRQ_REG_ADDR(v, addr, port) \
@@ -121,42 +133,73 @@
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
+#define DMACTL_BURSTEN_FLD(reg)		REG_FIELD(reg, 11, 11)
+#define DMACTL_BURSTEN_V2_FLD(reg)	REG_FIELD(reg, 20, 20)
+#define LPAIF_DMACTL_BURSTEN_SINGLE	0
+#define LPAIF_DMACTL_BURSTEN_INCR4	1
+
+#define DMACTL_WPSCNT_FLD(reg)		REG_FIELD(reg, 8, 10)
+#define DMACTL_WPSCNT_V2_FLD(reg)	REG_FIELD(reg, 16, 19)
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
+
+#define DMACTL_AUDINTF_FLD(reg)		REG_FIELD(reg, 4, 7)
+#define DMACTL_AUDINTF_V2_FLD(reg)	REG_FIELD(reg, 12, 15)
+#define LPAIF_DMACTL_AUDINTF(id)	id
+
+#define DMACTL_FIFOWM_FLD(reg)		REG_FIELD(reg, 1, 3)
+#define DMACTL_FIFOWM_V2_FLD(reg)	REG_FIELD(reg, 1, 5)
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
+
+#define DMACTL_ENABLE_FLD(reg)		REG_FIELD(reg, 0, 0)
+#define DMACTL_ENABLE_V2_FLD(reg)	REG_FIELD(reg, 0, 0)
+#define LPAIF_DMACTL_ENABLE_OFF		0
+#define LPAIF_DMACTL_ENABLE_ON		1
+
+#define DMACTL_DYNCLK_FLD(reg)		REG_FIELD(reg, 12, 12)
+#define DMACTL_DYNCLK_V2_FLD(reg)	REG_FIELD(reg, 21, 21)
+#define LPAIF_DMACTL_DYNCLK_OFF		0
+#define LPAIF_DMACTL_DYNCLK_ON		1
+
 #endif /* __LPASS_LPAIF_REG_H__ */
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 34f7fd1..3b2ec38 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -76,6 +76,23 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 	if (dma_ch < 0)
 		return dma_ch;
 
+	drvdata->dmactl[dma_ch] = devm_kzalloc(soc_runtime->dev,
+					       sizeof(struct lpaif_dmactl),
+					       GFP_KERNEL);
+	if (drvdata->dmactl[dma_ch] == NULL) {
+		dev_err(soc_runtime->dev, "error allocating dmactl fields\n");
+		return -ENOMEM;
+	}
+
+	ret = v->init_dmactl_fields(drvdata->dmactl[dma_ch],
+				    drvdata->lpaif_map,
+				    LPAIF_DMACTL_REG(v, dma_ch, dir));
+	if (ret) {
+		dev_err(soc_runtime->dev,
+			"error initializing dmactl fields: %d\n", ret);
+		return ret;
+	}
+
 	drvdata->substream[dma_ch] = substream;
 
 	ret = regmap_write(drvdata->lpaif_map,
@@ -132,13 +149,19 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	struct lpass_variant *v = drvdata->variant;
 	snd_pcm_format_t format = params_format(params);
 	unsigned int channels = params_channels(params);
-	unsigned int regval;
-	int ch, dir = substream->stream;
+	struct lpaif_dmactl *dmactl;
+	int ch;
 	int bitwidth;
 	int ret, dma_port = pcm_data->i2s_port + v->dmactl_audif_start;
 
 	ch = pcm_data->dma_ch;
 
+	dmactl = drvdata->dmactl[ch];
+	if (dmactl == NULL) {
+		dev_err(soc_runtime->dev, "invalid dma channel: %d\n", ch);
+		return -1;
+	}
+
 	bitwidth = snd_pcm_format_width(format);
 	if (bitwidth < 0) {
 		dev_err(soc_runtime->dev, "invalid bit width given: %d\n",
@@ -146,25 +169,29 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 		return bitwidth;
 	}
 
-	regval = LPAIF_DMACTL_BURSTEN_INCR4 |
-			LPAIF_DMACTL_AUDINTF(dma_port) |
-			LPAIF_DMACTL_FIFOWM_8;
+	ret = regmap_field_write(dmactl->bursten, LPAIF_DMACTL_BURSTEN_INCR4);
+	ret = regmap_field_write(dmactl->fifowm, LPAIF_DMACTL_FIFOWM_8);
+	ret = regmap_field_write(dmactl->intf, LPAIF_DMACTL_AUDINTF(dma_port));
 
 	switch (bitwidth) {
 	case 16:
 		switch (channels) {
 		case 1:
 		case 2:
-			regval |= LPAIF_DMACTL_WPSCNT_ONE;
+			ret = regmap_field_write(dmactl->wpscnt,
+						 LPAIF_DMACTL_WPSCNT_ONE);
 			break;
 		case 4:
-			regval |= LPAIF_DMACTL_WPSCNT_TWO;
+			ret = regmap_field_write(dmactl->wpscnt,
+						 LPAIF_DMACTL_WPSCNT_TWO);
 			break;
 		case 6:
-			regval |= LPAIF_DMACTL_WPSCNT_THREE;
+			ret = regmap_field_write(dmactl->wpscnt,
+						 LPAIF_DMACTL_WPSCNT_THREE);
 			break;
 		case 8:
-			regval |= LPAIF_DMACTL_WPSCNT_FOUR;
+			ret = regmap_field_write(dmactl->wpscnt,
+						 LPAIF_DMACTL_WPSCNT_FOUR);
 			break;
 		default:
 			dev_err(soc_runtime->dev,
@@ -177,19 +204,24 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	case 32:
 		switch (channels) {
 		case 1:
-			regval |= LPAIF_DMACTL_WPSCNT_ONE;
+			ret = regmap_field_write(dmactl->wpscnt,
+						 LPAIF_DMACTL_WPSCNT_ONE);
 			break;
 		case 2:
-			regval |= LPAIF_DMACTL_WPSCNT_TWO;
+			ret = regmap_field_write(dmactl->wpscnt,
+						 LPAIF_DMACTL_WPSCNT_TWO);
 			break;
 		case 4:
-			regval |= LPAIF_DMACTL_WPSCNT_FOUR;
+			ret = regmap_field_write(dmactl->wpscnt,
+						 LPAIF_DMACTL_WPSCNT_FOUR);
 			break;
 		case 6:
-			regval |= LPAIF_DMACTL_WPSCNT_SIX;
+			ret = regmap_field_write(dmactl->wpscnt,
+						 LPAIF_DMACTL_WPSCNT_SIX);
 			break;
 		case 8:
-			regval |= LPAIF_DMACTL_WPSCNT_EIGHT;
+			ret = regmap_field_write(dmactl->wpscnt,
+						 LPAIF_DMACTL_WPSCNT_EIGHT);
 			break;
 		default:
 			dev_err(soc_runtime->dev,
@@ -204,10 +236,8 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	ret = regmap_write(drvdata->lpaif_map,
-			LPAIF_DMACTL_REG(v, ch, dir), regval);
 	if (ret) {
-		dev_err(soc_runtime->dev, "error writing to rdmactl reg: %d\n",
+		dev_err(soc_runtime->dev, "error writing to dmactl reg: %d\n",
 			ret);
 		return ret;
 	}
@@ -244,9 +274,11 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
 	struct lpass_variant *v = drvdata->variant;
+	struct lpaif_dmactl *dmactl;
 	int ret, ch, dir = substream->stream;
 
 	ch = pcm_data->dma_ch;
+	dmactl = drvdata->dmactl[ch];
 
 	ret = regmap_write(drvdata->lpaif_map,
 			LPAIF_DMABASE_REG(v, ch, dir),
@@ -275,9 +307,7 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
 		return ret;
 	}
 
-	ret = regmap_update_bits(drvdata->lpaif_map,
-			LPAIF_DMACTL_REG(v, ch, dir),
-			LPAIF_DMACTL_ENABLE_MASK, LPAIF_DMACTL_ENABLE_ON);
+	ret = regmap_field_write(dmactl->enable, LPAIF_DMACTL_ENABLE_ON);
 	if (ret) {
 		dev_err(soc_runtime->dev, "error writing to rdmactl reg: %d\n",
 			ret);
@@ -296,9 +326,11 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
 	struct lpass_variant *v = drvdata->variant;
-	int ret, ch, dir = substream->stream;
+	struct lpaif_dmactl *dmactl;
+	int ret, ch;
 
 	ch = pcm_data->dma_ch;
+	dmactl = drvdata->dmactl[ch];
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -324,10 +356,8 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 			return ret;
 		}
 
-		ret = regmap_update_bits(drvdata->lpaif_map,
-				LPAIF_DMACTL_REG(v, ch, dir),
-				LPAIF_DMACTL_ENABLE_MASK,
-				LPAIF_DMACTL_ENABLE_ON);
+		ret = regmap_field_write(dmactl->enable,
+					 LPAIF_DMACTL_ENABLE_ON);
 		if (ret) {
 			dev_err(soc_runtime->dev,
 				"error writing to rdmactl reg: %d\n", ret);
@@ -337,10 +367,8 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		ret = regmap_update_bits(drvdata->lpaif_map,
-				LPAIF_DMACTL_REG(v, ch, dir),
-				LPAIF_DMACTL_ENABLE_MASK,
-				LPAIF_DMACTL_ENABLE_OFF);
+		ret = regmap_field_write(dmactl->enable,
+					 LPAIF_DMACTL_ENABLE_OFF);
 		if (ret) {
 			dev_err(soc_runtime->dev,
 				"error writing to rdmactl reg: %d\n", ret);
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 450020e..30cb2ef 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -17,6 +17,27 @@
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
 
@@ -55,6 +76,9 @@ struct lpass_data {
 	struct clk_bulk_data *clks;
 	int num_clks;
 
+	/* Regmap fields of I2SCTL & DMACTL registers bitfields */
+	struct lpaif_i2sctl *i2sctl[LPASS_MAX_MI2S_PORTS];
+	struct lpaif_dmactl *dmactl[LPASS_MAX_DMA_CHANNELS];
 };
 
 /* Vairant data per each SOC */
@@ -93,6 +117,12 @@ struct lpass_variant {
 	/* SOC specific clocks configuration */
 	const char **clk_name;
 	int num_clks;
+
+	/* SOC specific reg_fields initalizaion for control registers */
+	int (*init_i2sctl_fields)(struct lpaif_i2sctl *i2sctl,
+				  struct regmap *map, unsigned int reg);
+	int (*init_dmactl_fields)(struct lpaif_dmactl *dmactl,
+				  struct regmap *map, unsigned int reg);
 };
 
 /* register the platform driver from the CPU DAI driver */
-- 
('The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project')
