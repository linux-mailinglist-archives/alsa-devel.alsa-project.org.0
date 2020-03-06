Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AB817C863
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 23:33:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECBC6167B;
	Fri,  6 Mar 2020 23:32:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECBC6167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583533991;
	bh=klbQnODf7A+GMvMFRVCklriPBwtaWZGM7tNGyrb1ROQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DPZHr0WmeiMiscKsqIuPrYbDO7VrargUsJLG83PA1LhzlNddEwcTQBJ/D0WATwB5q
	 zu7Tpylj4P7MvDjg0h8E7WbtyTangFiRRnhB+FyeR2A/jhFXoAim8aqhel3q3hNWv3
	 UB3ry+XP+woIHl+3gITvhnN4wFTISbvRMkwCQyf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B18BF8028C;
	Fri,  6 Mar 2020 23:30:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25076F8028D; Fri,  6 Mar 2020 23:30:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83610F8028D
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 23:30:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83610F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="aofibF9T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1583533781; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KYpwDP7uSX0WQKMOu9T+wZZUfdnqJXfPhxn6hjS/0i4=;
 b=aofibF9TJUEn7bffsrQZNJVBY2PplI8NSpd5EiO3tJ0QhnBr1WeOotOJkChPg81j7jnLjG
 aKmK+rtTgEzBqRwRqd58dtGwfxKLM49y8Z/MWrEhEHwHQs4pyP3Z2e/wc3qiXh6OI1xly+
 02PaCSvEp1QW4VBIOYg4YNgN88MbLdY=
From: Paul Cercueil <paul@crapouillou.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 4/6] ASoC: jz4740-i2s: Avoid passing enum as match data
Date: Fri,  6 Mar 2020 23:29:29 +0100
Message-Id: <20200306222931.39664-4-paul@crapouillou.net>
In-Reply-To: <20200306222931.39664-1-paul@crapouillou.net>
References: <20200306222931.39664-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Zhou Yanjie <zhouyanjie@wanyeetech.com>,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me
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

Instead of passing an enum as match data, and checking its value in the
probe to register one or the other dai, pass a pointer to a struct
i2s_soc_info, which contains all the information relative to one SoC.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 sound/soc/jz4740/jz4740-i2s.c | 36 ++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index b7e5056a8fde..3f9b2e1b4747 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -93,6 +93,11 @@ enum jz47xx_i2s_version {
 	JZ_I2S_JZ4780,
 };
 
+struct i2s_soc_info {
+	enum jz47xx_i2s_version version;
+	struct snd_soc_dai_driver *dai;
+};
+
 struct jz4740_i2s {
 	struct resource *mem;
 	void __iomem *base;
@@ -104,7 +109,7 @@ struct jz4740_i2s {
 	struct snd_dmaengine_dai_dma_data playback_dma_data;
 	struct snd_dmaengine_dai_dma_data capture_dma_data;
 
-	enum jz47xx_i2s_version version;
+	const struct i2s_soc_info *soc_info;
 };
 
 static inline uint32_t jz4740_i2s_read(const struct jz4740_i2s *i2s,
@@ -284,7 +289,7 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 		ctrl &= ~JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_MASK;
 		ctrl |= sample_size << JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET;
 
-		if (i2s->version >= JZ_I2S_JZ4780) {
+		if (i2s->soc_info->version >= JZ_I2S_JZ4780) {
 			div_reg &= ~I2SDIV_IDV_MASK;
 			div_reg |= (div - 1) << I2SDIV_IDV_SHIFT;
 		} else {
@@ -398,7 +403,7 @@ static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
 	snd_soc_dai_init_dma_data(dai, &i2s->playback_dma_data,
 		&i2s->capture_dma_data);
 
-	if (i2s->version >= JZ_I2S_JZ4780) {
+	if (i2s->soc_info->version >= JZ_I2S_JZ4780) {
 		conf = (7 << JZ4780_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET) |
 			(8 << JZ4780_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET) |
 			JZ_AIC_CONF_OVERFLOW_PLAY_LAST |
@@ -457,6 +462,11 @@ static struct snd_soc_dai_driver jz4740_i2s_dai = {
 	.ops = &jz4740_i2s_dai_ops,
 };
 
+static const struct i2s_soc_info jz4740_i2s_soc_info = {
+	.version = JZ_I2S_JZ4740,
+	.dai = &jz4740_i2s_dai,
+};
+
 static struct snd_soc_dai_driver jz4780_i2s_dai = {
 	.probe = jz4740_i2s_dai_probe,
 	.remove = jz4740_i2s_dai_remove,
@@ -475,6 +485,11 @@ static struct snd_soc_dai_driver jz4780_i2s_dai = {
 	.ops = &jz4740_i2s_dai_ops,
 };
 
+static const struct i2s_soc_info jz4780_i2s_soc_info = {
+	.version = JZ_I2S_JZ4780,
+	.dai = &jz4780_i2s_dai,
+};
+
 static const struct snd_soc_component_driver jz4740_i2s_component = {
 	.name		= "jz4740-i2s",
 	.suspend	= jz4740_i2s_suspend,
@@ -483,8 +498,8 @@ static const struct snd_soc_component_driver jz4740_i2s_component = {
 
 #ifdef CONFIG_OF
 static const struct of_device_id jz4740_of_matches[] = {
-	{ .compatible = "ingenic,jz4740-i2s", .data = (void *)JZ_I2S_JZ4740 },
-	{ .compatible = "ingenic,jz4780-i2s", .data = (void *)JZ_I2S_JZ4780 },
+	{ .compatible = "ingenic,jz4740-i2s", .data = &jz4740_i2s_soc_info },
+	{ .compatible = "ingenic,jz4780-i2s", .data = &jz4780_i2s_soc_info },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jz4740_of_matches);
@@ -501,7 +516,7 @@ static int jz4740_i2s_dev_probe(struct platform_device *pdev)
 	if (!i2s)
 		return -ENOMEM;
 
-	i2s->version = (enum jz47xx_i2s_version)of_device_get_match_data(dev);
+	i2s->soc_info = device_get_match_data(dev);
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	i2s->base = devm_ioremap_resource(dev, mem);
@@ -520,13 +535,8 @@ static int jz4740_i2s_dev_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, i2s);
 
-	if (i2s->version == JZ_I2S_JZ4780)
-		ret = devm_snd_soc_register_component(dev,
-			&jz4740_i2s_component, &jz4780_i2s_dai, 1);
-	else
-		ret = devm_snd_soc_register_component(dev,
-			&jz4740_i2s_component, &jz4740_i2s_dai, 1);
-
+	ret = devm_snd_soc_register_component(dev, &jz4740_i2s_component,
+					      i2s->soc_info->dai, 1);
 	if (ret)
 		return ret;
 
-- 
2.25.1

