Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AEE56BD28
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 18:04:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19F0E1622;
	Fri,  8 Jul 2022 18:03:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19F0E1622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657296253;
	bh=3ZLei3D8IGfLbyjXbnFSKH4G+Swi7B1GxeSzuAomgTo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ve+FpM0UpkzBldldrcz2Mrd6y7VZV1hTrHI3b2Qn8D9CB+qpsMZDBO38g5xLwl2sb
	 5r5B5jW25krwCB58qIfh5lZlLXuH3zgpKCz301RvnfC57mWnAyCa0dQ9DsYRKTmWKt
	 VbeXkg3Subg2WWtLq9fsq18WwR2WGGdY8y2CgGFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB37BF80549;
	Fri,  8 Jul 2022 18:02:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73DCCF8053C; Fri,  8 Jul 2022 18:02:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65810F80166
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 18:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65810F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bnoTyXns"
Received: by mail-wr1-x42c.google.com with SMTP id r14so25373396wrg.1
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 09:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rA03QvKE9ije3JAkiRACkxkuEqw4L+4JjOvYpl8NfrM=;
 b=bnoTyXnsLWJedY1wJMs6Tdn2sAMWhGfYT0Vz5eeBNg6b5ehkAowR1X9uwhYhBOYGwq
 E1E+Iyu3hhr/WV9QJrbFDrqaNccFEyUA3H1ejT+OGr+lMEbAA4HRjZgOd58yog2Ti9fr
 IVtsQmDEUmgnQGsl2LFFqOfYwLD5Wriax8xaP31LPAlioUqJIkLIDV9P0DuPHOIHRycB
 c4m2EYDTCAGf20X1e/R3bchcDPnC57WI4aRiAuIDmdVBo5iqWmde1toZcPhUPTAK5z/S
 O/ldFoFqdJy6Q6SQZFEoHrl8j0el47rSa7K2xfkfEz7/Xosr//BcP1m4PqFQddCrMcjs
 Lbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rA03QvKE9ije3JAkiRACkxkuEqw4L+4JjOvYpl8NfrM=;
 b=JGTJUvnGxUOMfjEEDgV7PrkF2vDBxqUdtQpmNoAbsL6MvSVwPUJ9EaMFPbQL31bCZk
 OMNUHuFcCFCq4KX20rLPHobaHSpD/PPL7et2LdzlYsMiggS/Oue0dpXmX37y993Dz+6s
 5MZnMAkrQafw2uHHdjxkSbTIXwxWIg9un3vqsb/XdRxUtDTOWEjF7CUHTDmHh/owRgf4
 1YF4C+LWwQceHKQSfuzygmbc93bbuYZ9U9dWa8ecTRABv3MR9+T/xyoWoQLdq7jnC/Py
 2et781Yi9wTXvkQAtG8rbxmg4e3ywI+k/yIO3++S8HXA1TDDKsNfBKsAsAmjFeICO9XV
 ZJfg==
X-Gm-Message-State: AJIora/c66nntny9li6EendvMWCki0XoGUfj/9eWmX/LiGYHx0xlXtj0
 JkDC9Dw7muJN46HCkjIlcws=
X-Google-Smtp-Source: AGRyM1uWw2MdEV2fZPcfFsKiQSDlhfZp4Acxq8czhHSM6I32h9tgrF7DYEZU0k3n7ztdY8XQ55KXGA==
X-Received: by 2002:adf:e94c:0:b0:21d:81f4:7de2 with SMTP id
 m12-20020adfe94c000000b0021d81f47de2mr4178289wrn.338.1657296130588; 
 Fri, 08 Jul 2022 09:02:10 -0700 (PDT)
Received: from localhost (92.40.203.144.threembb.co.uk. [92.40.203.144])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b0039c747a1e8fsm3298089wmp.7.2022.07.08.09.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 09:02:10 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v4 03/11] ASoC: jz4740-i2s: Convert to regmap API
Date: Fri,  8 Jul 2022 17:02:36 +0100
Message-Id: <20220708160244.21933-4-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
References: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

Using regmap for accessing the AIC registers makes the driver a
little easier to read, and later refactors can take advantage of
regmap APIs to further simplify the driver.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/Kconfig      |   1 +
 sound/soc/jz4740/jz4740-i2s.c | 107 +++++++++++++---------------------
 2 files changed, 40 insertions(+), 68 deletions(-)

diff --git a/sound/soc/jz4740/Kconfig b/sound/soc/jz4740/Kconfig
index e72f826062e9..dd3b4507fbe6 100644
--- a/sound/soc/jz4740/Kconfig
+++ b/sound/soc/jz4740/Kconfig
@@ -3,6 +3,7 @@ config SND_JZ4740_SOC_I2S
 	tristate "SoC Audio (I2S protocol) for Ingenic JZ4740 SoC"
 	depends on MIPS || COMPILE_TEST
 	depends on HAS_IOMEM
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y if you want to use I2S protocol and I2S codec on Ingenic JZ4740
diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index adf896333584..1393b383a886 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 #include <linux/clk.h>
@@ -98,7 +99,7 @@ struct i2s_soc_info {
 };
 
 struct jz4740_i2s {
-	void __iomem *base;
+	struct regmap *regmap;
 
 	struct clk *clk_aic;
 	struct clk *clk_i2s;
@@ -109,23 +110,10 @@ struct jz4740_i2s {
 	const struct i2s_soc_info *soc_info;
 };
 
-static inline uint32_t jz4740_i2s_read(const struct jz4740_i2s *i2s,
-	unsigned int reg)
-{
-	return readl(i2s->base + reg);
-}
-
-static inline void jz4740_i2s_write(const struct jz4740_i2s *i2s,
-	unsigned int reg, uint32_t value)
-{
-	writel(value, i2s->base + reg);
-}
-
 static int jz4740_i2s_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *dai)
 {
 	struct jz4740_i2s *i2s = snd_soc_dai_get_drvdata(dai);
-	uint32_t conf, ctrl;
 	int ret;
 
 	/*
@@ -133,14 +121,10 @@ static int jz4740_i2s_startup(struct snd_pcm_substream *substream,
 	 * FIFO that is starting up.
 	 */
 	if (!i2s->soc_info->shared_fifo_flush) {
-		ctrl = jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
-
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			ctrl |= JZ4760_AIC_CTRL_TFLUSH;
+			regmap_set_bits(i2s->regmap, JZ_REG_AIC_CTRL, JZ4760_AIC_CTRL_TFLUSH);
 		else
-			ctrl |= JZ4760_AIC_CTRL_RFLUSH;
-
-		jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
+			regmap_set_bits(i2s->regmap, JZ_REG_AIC_CTRL, JZ4760_AIC_CTRL_RFLUSH);
 	}
 
 	if (snd_soc_dai_active(dai))
@@ -150,20 +134,14 @@ static int jz4740_i2s_startup(struct snd_pcm_substream *substream,
 	 * When there is a shared flush bit for both FIFOs we can
 	 * only flush the FIFOs if no other stream has started.
 	 */
-	if (i2s->soc_info->shared_fifo_flush) {
-		ctrl = jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
-		ctrl |= JZ_AIC_CTRL_FLUSH;
-		jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
-	}
+	if (i2s->soc_info->shared_fifo_flush)
+		regmap_set_bits(i2s->regmap, JZ_REG_AIC_CTRL, JZ_AIC_CTRL_FLUSH);
 
 	ret = clk_prepare_enable(i2s->clk_i2s);
 	if (ret)
 		return ret;
 
-	conf = jz4740_i2s_read(i2s, JZ_REG_AIC_CONF);
-	conf |= JZ_AIC_CONF_ENABLE;
-	jz4740_i2s_write(i2s, JZ_REG_AIC_CONF, conf);
-
+	regmap_set_bits(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_ENABLE);
 	return 0;
 }
 
@@ -171,14 +149,11 @@ static void jz4740_i2s_shutdown(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *dai)
 {
 	struct jz4740_i2s *i2s = snd_soc_dai_get_drvdata(dai);
-	uint32_t conf;
 
 	if (snd_soc_dai_active(dai))
 		return;
 
-	conf = jz4740_i2s_read(i2s, JZ_REG_AIC_CONF);
-	conf &= ~JZ_AIC_CONF_ENABLE;
-	jz4740_i2s_write(i2s, JZ_REG_AIC_CONF, conf);
+	regmap_clear_bits(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_ENABLE);
 
 	clk_disable_unprepare(i2s->clk_i2s);
 }
@@ -187,8 +162,6 @@ static int jz4740_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	struct snd_soc_dai *dai)
 {
 	struct jz4740_i2s *i2s = snd_soc_dai_get_drvdata(dai);
-
-	uint32_t ctrl;
 	uint32_t mask;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -196,38 +169,30 @@ static int jz4740_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	else
 		mask = JZ_AIC_CTRL_ENABLE_CAPTURE | JZ_AIC_CTRL_ENABLE_RX_DMA;
 
-	ctrl = jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
-
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		ctrl |= mask;
+		regmap_set_bits(i2s->regmap, JZ_REG_AIC_CTRL, mask);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		ctrl &= ~mask;
+		regmap_clear_bits(i2s->regmap, JZ_REG_AIC_CTRL, mask);
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
-
 	return 0;
 }
 
 static int jz4740_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct jz4740_i2s *i2s = snd_soc_dai_get_drvdata(dai);
-
-	uint32_t format = 0;
-	uint32_t conf;
-
-	conf = jz4740_i2s_read(i2s, JZ_REG_AIC_CONF);
-
-	conf &= ~(JZ_AIC_CONF_BIT_CLK_MASTER | JZ_AIC_CONF_SYNC_CLK_MASTER);
+	const unsigned int conf_mask = JZ_AIC_CONF_BIT_CLK_MASTER |
+				       JZ_AIC_CONF_SYNC_CLK_MASTER;
+	unsigned int conf = 0, format = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_BP_FP:
@@ -263,8 +228,8 @@ static int jz4740_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	jz4740_i2s_write(i2s, JZ_REG_AIC_CONF, conf);
-	jz4740_i2s_write(i2s, JZ_REG_AIC_I2S_FMT, format);
+	regmap_update_bits(i2s->regmap, JZ_REG_AIC_CONF, conf_mask, conf);
+	regmap_write(i2s->regmap, JZ_REG_AIC_I2S_FMT, format);
 
 	return 0;
 }
@@ -277,9 +242,9 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 	uint32_t ctrl, div_reg;
 	int div;
 
-	ctrl = jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
+	regmap_read(i2s->regmap, JZ_REG_AIC_CTRL, &ctrl);
+	regmap_read(i2s->regmap, JZ_REG_AIC_CLK_DIV, &div_reg);
 
-	div_reg = jz4740_i2s_read(i2s, JZ_REG_AIC_CLK_DIV);
 	div = clk_get_rate(i2s->clk_i2s) / (64 * params_rate(params));
 
 	switch (params_format(params)) {
@@ -316,8 +281,8 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
-	jz4740_i2s_write(i2s, JZ_REG_AIC_CLK_DIV, div_reg);
+	regmap_write(i2s->regmap, JZ_REG_AIC_CTRL, ctrl);
+	regmap_write(i2s->regmap, JZ_REG_AIC_CLK_DIV, div_reg);
 
 	return 0;
 }
@@ -354,13 +319,9 @@ static int jz4740_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 static int jz4740_i2s_suspend(struct snd_soc_component *component)
 {
 	struct jz4740_i2s *i2s = snd_soc_component_get_drvdata(component);
-	uint32_t conf;
 
 	if (snd_soc_component_active(component)) {
-		conf = jz4740_i2s_read(i2s, JZ_REG_AIC_CONF);
-		conf &= ~JZ_AIC_CONF_ENABLE;
-		jz4740_i2s_write(i2s, JZ_REG_AIC_CONF, conf);
-
+		regmap_clear_bits(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_ENABLE);
 		clk_disable_unprepare(i2s->clk_i2s);
 	}
 
@@ -372,7 +333,6 @@ static int jz4740_i2s_suspend(struct snd_soc_component *component)
 static int jz4740_i2s_resume(struct snd_soc_component *component)
 {
 	struct jz4740_i2s *i2s = snd_soc_component_get_drvdata(component);
-	uint32_t conf;
 	int ret;
 
 	ret = clk_prepare_enable(i2s->clk_aic);
@@ -386,9 +346,7 @@ static int jz4740_i2s_resume(struct snd_soc_component *component)
 			return ret;
 		}
 
-		conf = jz4740_i2s_read(i2s, JZ_REG_AIC_CONF);
-		conf |= JZ_AIC_CONF_ENABLE;
-		jz4740_i2s_write(i2s, JZ_REG_AIC_CONF, conf);
+		regmap_set_bits(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_ENABLE);
 	}
 
 	return 0;
@@ -421,8 +379,8 @@ static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
 			JZ_AIC_CONF_INTERNAL_CODEC;
 	}
 
-	jz4740_i2s_write(i2s, JZ_REG_AIC_CONF, JZ_AIC_CONF_RESET);
-	jz4740_i2s_write(i2s, JZ_REG_AIC_CONF, conf);
+	regmap_write(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_RESET);
+	regmap_write(i2s->regmap, JZ_REG_AIC_CONF, conf);
 
 	return 0;
 }
@@ -521,11 +479,19 @@ static const struct of_device_id jz4740_of_matches[] = {
 };
 MODULE_DEVICE_TABLE(of, jz4740_of_matches);
 
+static const struct regmap_config jz4740_i2s_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= JZ_REG_AIC_FIFO,
+};
+
 static int jz4740_i2s_dev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct jz4740_i2s *i2s;
 	struct resource *mem;
+	void __iomem *regs;
 	int ret;
 
 	i2s = devm_kzalloc(dev, sizeof(*i2s), GFP_KERNEL);
@@ -534,9 +500,9 @@ static int jz4740_i2s_dev_probe(struct platform_device *pdev)
 
 	i2s->soc_info = device_get_match_data(dev);
 
-	i2s->base = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
-	if (IS_ERR(i2s->base))
-		return PTR_ERR(i2s->base);
+	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
 
 	i2s->playback_dma_data.maxburst = 16;
 	i2s->playback_dma_data.addr = mem->start + JZ_REG_AIC_FIFO;
@@ -552,6 +518,11 @@ static int jz4740_i2s_dev_probe(struct platform_device *pdev)
 	if (IS_ERR(i2s->clk_i2s))
 		return PTR_ERR(i2s->clk_i2s);
 
+	i2s->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
+					    &jz4740_i2s_regmap_config);
+	if (IS_ERR(i2s->regmap))
+		return PTR_ERR(i2s->regmap);
+
 	platform_set_drvdata(pdev, i2s);
 
 	ret = devm_snd_soc_register_component(dev, &jz4740_i2s_component,
-- 
2.35.1

