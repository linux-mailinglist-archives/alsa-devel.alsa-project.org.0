Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1A256B768
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 12:44:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83B37164D;
	Fri,  8 Jul 2022 12:43:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83B37164D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657277059;
	bh=JMzp+Iaqo+z0AGu6VKh18xcye+ersStF5zu77Yib5rQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JfpPQU7+HRo08lWNUiCLykeyUKLwgl+JwFnVH2bt74T+K7Q5kjSe6COAeDtDToy2l
	 zPYs7yShBzR/ahtyCJMZEqFg8RtXInmT0+pfse2LtEyssLODwVT9QixK8zp2s1CoMw
	 LyDs2qVz9nqfnVIdZNVZwKK71nVbOtyd2OmeFxtY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2B7DF8054A;
	Fri,  8 Jul 2022 12:42:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EE01F80543; Fri,  8 Jul 2022 12:42:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 049C4F80538
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 12:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 049C4F80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Gx+ezl8r"
Received: by mail-wr1-x434.google.com with SMTP id d16so23645209wrv.10
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 03:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+czFW2+9KjCaFRnnRgA1Q38cQLtCpG3rkiwunQ6DhPY=;
 b=Gx+ezl8rmQ5jqwegrFj0FQXLbvTq5vuYspJxDg1Z4ttNZ1mu+b3zCwwE6lzizqBz78
 Mgl2UigYv8SH7fX4JnDEG/t31XY/EEEd0l1ogpCWsa3Kta6U2NqzxqzhegGa8pQKOe4t
 cubtbjv6FbXoPVi7sa/5EYPZEPJ5AfVJlFu07xLEvaKCVouVllwZyk3vhjYq8blvi7iK
 AlrltKtqbXXOy2aoIFzRTJ0abuoax4aQfeoh0ZiPSfdjq7ZK2yqDxHPD2LEOxIJ7n3wd
 tBdifeFdPjwOKvQEJfVoludJC5ThmekKvkGVMEV00E69CJigmW5rmI+lgsBJcij5rWdn
 sBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+czFW2+9KjCaFRnnRgA1Q38cQLtCpG3rkiwunQ6DhPY=;
 b=Nnu6wnYshndanwkdGn05gDKPHAKLY21c/4d4WTKLEm7eunCS8ezsk1wq+t4LonC1hn
 7QQPZitcD7h3FLdPysqjsb8Ww1Akl+g30dPqjblnTFi1WjCqmbkrcxyxgo6Z3s1EiIq/
 J5Tk7H+i5kDzpPubXQoURHvZdht8hTLlYoGjXJjyAQAPUODpPg1jH6ZoqxSlnJQ5JkGQ
 NVM+6+Ue64EfqAR8fdtcc8F66zqouggxlaZ5dXly57E4jXsPxCRmmSyKYGMICbNA0uBB
 st4tXx1OAcQXbTQH15g1lvx8tdyFsAVTgWlLwvzw19ZBodNqIsegBe6I40BOC3H5V2Ln
 wLag==
X-Gm-Message-State: AJIora9Mj+du273BqooGEM4V915s74+AlWVVJAITdfinICUi33CNdtVu
 2ArCotEvUb1xcDUIjqUJFfM=
X-Google-Smtp-Source: AGRyM1tVb+QyACG1uoLbjLTEkQ0TGWBaNLqmBpHtwLX+kBjsC2l+Zu3siLOhYpY2g3fOH4HhM3OKFw==
X-Received: by 2002:adf:fa8f:0:b0:21b:9811:43e7 with SMTP id
 h15-20020adffa8f000000b0021b981143e7mr2788375wrr.275.1657276944298; 
 Fri, 08 Jul 2022 03:42:24 -0700 (PDT)
Received: from localhost (92.40.203.220.threembb.co.uk. [92.40.203.220])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a05600c354300b003a0502c620dsm1584585wmq.44.2022.07.08.03.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 03:42:23 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v3 03/11] ASoC: jz4740-i2s: Simplify using regmap fields
Date: Fri,  8 Jul 2022 11:42:56 +0100
Message-Id: <20220708104304.51415-4-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220708104304.51415-1-aidanmacdonald.0x0@gmail.com>
References: <20220708104304.51415-1-aidanmacdonald.0x0@gmail.com>
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

The differences between register fields on different SoC versions
can be abstracted away using the regmap field API. This is easier
to understand and extend than comparisons based on the version ID.
Since the version IDs are unused after this change, remove them at
the same time, and remove unused macros.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 133 +++++++++++++++++++---------------
 1 file changed, 76 insertions(+), 57 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 69ccec0f09d9..bd73427b837e 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -34,8 +34,6 @@
 #define JZ_REG_AIC_CLK_DIV	0x30
 #define JZ_REG_AIC_FIFO		0x34
 
-#define JZ_AIC_CONF_FIFO_RX_THRESHOLD_MASK (0xf << 12)
-#define JZ_AIC_CONF_FIFO_TX_THRESHOLD_MASK (0xf <<  8)
 #define JZ_AIC_CONF_OVERFLOW_PLAY_LAST BIT(6)
 #define JZ_AIC_CONF_INTERNAL_CODEC BIT(5)
 #define JZ_AIC_CONF_I2S BIT(4)
@@ -44,11 +42,6 @@
 #define JZ_AIC_CONF_SYNC_CLK_MASTER BIT(1)
 #define JZ_AIC_CONF_ENABLE BIT(0)
 
-#define JZ_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET 12
-#define JZ_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET 8
-#define JZ4760_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET 24
-#define JZ4760_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET 16
-
 #define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_MASK (0x7 << 19)
 #define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_MASK (0x7 << 16)
 #define JZ_AIC_CTRL_ENABLE_RX_DMA BIT(15)
@@ -75,27 +68,23 @@
 
 #define JZ_AIC_I2S_STATUS_BUSY BIT(2)
 
-#define JZ_AIC_CLK_DIV_MASK 0xf
-#define I2SDIV_DV_SHIFT 0
-#define I2SDIV_DV_MASK (0xf << I2SDIV_DV_SHIFT)
-#define I2SDIV_IDV_SHIFT 8
-#define I2SDIV_IDV_MASK (0xf << I2SDIV_IDV_SHIFT)
-
-enum jz47xx_i2s_version {
-	JZ_I2S_JZ4740,
-	JZ_I2S_JZ4760,
-	JZ_I2S_JZ4770,
-	JZ_I2S_JZ4780,
-};
-
 struct i2s_soc_info {
-	enum jz47xx_i2s_version version;
 	struct snd_soc_dai_driver *dai;
+
+	struct reg_field field_rx_fifo_thresh;
+	struct reg_field field_tx_fifo_thresh;
+	struct reg_field field_i2sdiv_capture;
+	struct reg_field field_i2sdiv_playback;
 };
 
 struct jz4740_i2s {
 	struct regmap *regmap;
 
+	struct regmap_field *field_rx_fifo_thresh;
+	struct regmap_field *field_tx_fifo_thresh;
+	struct regmap_field *field_i2sdiv_capture;
+	struct regmap_field *field_i2sdiv_playback;
+
 	struct clk *clk_aic;
 	struct clk *clk_i2s;
 
@@ -217,12 +206,12 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
 {
 	struct jz4740_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	struct regmap_field *div_field;
 	unsigned int sample_size;
-	uint32_t ctrl, div_reg;
+	uint32_t ctrl;
 	int div;
 
 	regmap_read(i2s->regmap, JZ_REG_AIC_CTRL, &ctrl);
-	regmap_read(i2s->regmap, JZ_REG_AIC_CLK_DIV, &div_reg);
 
 	div = clk_get_rate(i2s->clk_i2s) / (64 * params_rate(params));
 
@@ -245,23 +234,16 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 		else
 			ctrl &= ~JZ_AIC_CTRL_MONO_TO_STEREO;
 
-		div_reg &= ~I2SDIV_DV_MASK;
-		div_reg |= (div - 1) << I2SDIV_DV_SHIFT;
+		div_field = i2s->field_i2sdiv_playback;
 	} else {
 		ctrl &= ~JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_MASK;
 		ctrl |= sample_size << JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET;
 
-		if (i2s->soc_info->version >= JZ_I2S_JZ4770) {
-			div_reg &= ~I2SDIV_IDV_MASK;
-			div_reg |= (div - 1) << I2SDIV_IDV_SHIFT;
-		} else {
-			div_reg &= ~I2SDIV_DV_MASK;
-			div_reg |= (div - 1) << I2SDIV_DV_SHIFT;
-		}
+		div_field = i2s->field_i2sdiv_capture;
 	}
 
 	regmap_write(i2s->regmap, JZ_REG_AIC_CTRL, ctrl);
-	regmap_write(i2s->regmap, JZ_REG_AIC_CLK_DIV, div_reg);
+	regmap_field_write(div_field, div - 1);
 
 	return 0;
 }
@@ -334,7 +316,6 @@ static int jz4740_i2s_resume(struct snd_soc_component *component)
 static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
 {
 	struct jz4740_i2s *i2s = snd_soc_dai_get_drvdata(dai);
-	uint32_t conf;
 	int ret;
 
 	ret = clk_prepare_enable(i2s->clk_aic);
@@ -344,22 +325,14 @@ static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
 	snd_soc_dai_init_dma_data(dai, &i2s->playback_dma_data,
 		&i2s->capture_dma_data);
 
-	if (i2s->soc_info->version >= JZ_I2S_JZ4760) {
-		conf = (7 << JZ4760_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET) |
-			(8 << JZ4760_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET) |
-			JZ_AIC_CONF_OVERFLOW_PLAY_LAST |
-			JZ_AIC_CONF_I2S |
-			JZ_AIC_CONF_INTERNAL_CODEC;
-	} else {
-		conf = (7 << JZ_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET) |
-			(8 << JZ_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET) |
-			JZ_AIC_CONF_OVERFLOW_PLAY_LAST |
-			JZ_AIC_CONF_I2S |
-			JZ_AIC_CONF_INTERNAL_CODEC;
-	}
-
 	regmap_write(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_RESET);
-	regmap_write(i2s->regmap, JZ_REG_AIC_CONF, conf);
+
+	regmap_write(i2s->regmap, JZ_REG_AIC_CONF,
+		     JZ_AIC_CONF_OVERFLOW_PLAY_LAST |
+		     JZ_AIC_CONF_I2S | JZ_AIC_CONF_INTERNAL_CODEC);
+
+	regmap_field_write(i2s->field_rx_fifo_thresh, 7);
+	regmap_field_write(i2s->field_tx_fifo_thresh, 8);
 
 	return 0;
 }
@@ -404,13 +377,19 @@ static struct snd_soc_dai_driver jz4740_i2s_dai = {
 };
 
 static const struct i2s_soc_info jz4740_i2s_soc_info = {
-	.version = JZ_I2S_JZ4740,
-	.dai = &jz4740_i2s_dai,
+	.dai			= &jz4740_i2s_dai,
+	.field_rx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 12, 15),
+	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 8, 11),
+	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
+	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
 };
 
 static const struct i2s_soc_info jz4760_i2s_soc_info = {
-	.version = JZ_I2S_JZ4760,
-	.dai = &jz4740_i2s_dai,
+	.dai			= &jz4740_i2s_dai,
+	.field_rx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
+	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
+	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
+	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
 };
 
 static struct snd_soc_dai_driver jz4770_i2s_dai = {
@@ -432,13 +411,19 @@ static struct snd_soc_dai_driver jz4770_i2s_dai = {
 };
 
 static const struct i2s_soc_info jz4770_i2s_soc_info = {
-	.version = JZ_I2S_JZ4770,
-	.dai = &jz4770_i2s_dai,
+	.dai			= &jz4770_i2s_dai,
+	.field_rx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
+	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
+	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 8, 11),
+	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
 };
 
 static const struct i2s_soc_info jz4780_i2s_soc_info = {
-	.version = JZ_I2S_JZ4780,
-	.dai = &jz4770_i2s_dai,
+	.dai			= &jz4770_i2s_dai,
+	.field_rx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
+	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
+	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 8, 11),
+	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
 };
 
 static const struct snd_soc_component_driver jz4740_i2s_component = {
@@ -457,6 +442,36 @@ static const struct of_device_id jz4740_of_matches[] = {
 };
 MODULE_DEVICE_TABLE(of, jz4740_of_matches);
 
+static int jz4740_i2s_init_regmap_fields(struct device *dev,
+					 struct jz4740_i2s *i2s)
+{
+	i2s->field_rx_fifo_thresh =
+		devm_regmap_field_alloc(dev, i2s->regmap,
+					i2s->soc_info->field_rx_fifo_thresh);
+	if (IS_ERR(i2s->field_rx_fifo_thresh))
+		return PTR_ERR(i2s->field_rx_fifo_thresh);
+
+	i2s->field_tx_fifo_thresh =
+		devm_regmap_field_alloc(dev, i2s->regmap,
+					i2s->soc_info->field_tx_fifo_thresh);
+	if (IS_ERR(i2s->field_tx_fifo_thresh))
+		return PTR_ERR(i2s->field_tx_fifo_thresh);
+
+	i2s->field_i2sdiv_capture =
+		devm_regmap_field_alloc(dev, i2s->regmap,
+					i2s->soc_info->field_i2sdiv_capture);
+	if (IS_ERR(i2s->field_i2sdiv_capture))
+		return PTR_ERR(i2s->field_i2sdiv_capture);
+
+	i2s->field_i2sdiv_playback =
+		devm_regmap_field_alloc(dev, i2s->regmap,
+					i2s->soc_info->field_i2sdiv_playback);
+	if (IS_ERR(i2s->field_i2sdiv_playback))
+		return PTR_ERR(i2s->field_i2sdiv_playback);
+
+	return 0;
+}
+
 static const struct regmap_config jz4740_i2s_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
@@ -501,6 +516,10 @@ static int jz4740_i2s_dev_probe(struct platform_device *pdev)
 	if (IS_ERR(i2s->regmap))
 		return PTR_ERR(i2s->regmap);
 
+	ret = jz4740_i2s_init_regmap_fields(dev, i2s);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, i2s);
 
 	ret = devm_snd_soc_register_component(dev, &jz4740_i2s_component,
-- 
2.35.1

